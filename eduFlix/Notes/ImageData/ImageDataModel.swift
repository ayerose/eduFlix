//
//  ImageDataModel.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import Foundation
import SwiftUI


struct ImageAndNote : Codable, Hashable, Identifiable {
    var image : Data?
    var description: String
    var id = UUID()
    var title : String
}


@MainActor class ImageData : ObservableObject {
    private let IMAGES_KEY = "ImagesKey"
    var imageNote: [ImageAndNote] {
        didSet {
            objectWillChange.send()
            saveData()
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: IMAGES_KEY) {
            if let decodedNotes = try? JSONDecoder().decode([ImageAndNote].self, from: data) {
                imageNote = decodedNotes
                print("Note data successfully retrieved!")
                return
            }
        }
        imageNote = []
    }
    
    func addNote(image: UIImage, title: String, desc: String) {
        if let pngRepresentation = image.pngData() {

            let tempNote = ImageAndNote(image: pngRepresentation, description: desc,  title: title)
            imageNote.insert(tempNote, at: 0)
            print("Image added!")
            saveData()
        }
    }
    
    func editNote(id: UUID, title: String, description: String) {
        if let note = imageNote.first(where: { $0.id == id }) {
            let index = imageNote.firstIndex(of: note)
        
            imageNote[index!].title = title
            imageNote[index!].description = description
        }
    }
    
    private func saveData() {
        if let encodedNotes = try? JSONEncoder().encode(imageNote) {
            UserDefaults.standard.set(encodedNotes, forKey: IMAGES_KEY)
        }
    }
    
    func deleteNotes() {
        // delete saved notes 
        UserDefaults.standard.removeObject(forKey: "ImagesKey")
     
        
        imageNote = []
    }
}
