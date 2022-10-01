//
//  NotesView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.

//test

import SwiftUI

struct NotesView: View {
    @StateObject  var imageData = ImageData()
    @State var revealImagePicker: Bool = false
    var body: some View {
         
        NavigationView {
        ZStack {
            VStack {
                Text("Notes ").font(.largeTitle)
                    .font(.title3).bold()
                    .padding()
                   // .position(x: 100, y: 100)
                    .frame(maxWidth: .infinity, alignment: .leading) .font(.system(.title, design: .rounded))
                    .font(.system(size: 10))
                    
                    .foregroundColor(Color("Orange"))
                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.light).foregroundColor(.white)
                
                if imageData.imageNote.isEmpty {
                    Text("Add new note")
                        .foregroundColor(.orange)
                        .font(Font.system(size: 16).italic())

                } else {
                    MainView().environmentObject(imageData)
                }
            }
        }
       
            .sheet(isPresented: $revealImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    //add note
                    imageData.addNote(image: image, title: "Edit Your Note", desc: "")
                }
                
            }
          //.background(Color(hue: 0.26, saturation: 0.101, brightness: 0.9))
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
   
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        revealImagePicker.toggle()
                    } label: {
                        Label("Image", systemImage: "plus.square.fill")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation{
                            // delete data
                            imageData.deleteNotes()
                        }
                    } label: {
                        Label("Bin", systemImage: "trash")
                    }
                }
            }        .environmentObject(imageData)
    
        
        }

       // .navigationTitle("My Notes")
        
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        NotesView()
            .environmentObject(ImageData())
    }
}
