//
//  NotesSectionView.swift
//  eduFlix
//
//  Created by Soreya Koura on 26.04.22.
//

import SwiftUI

struct NotesSectionView: View {
    
    @Binding var selection: Tab
    
    let notes: [String] = ["UX Research Interviews", "SEO/SMO", "WEB DEV", "Lecture notes 22/2"]
    let colors: [Color] = [
        Color(red: 38/255, green: 1, blue: 60/255),
        Color(red: 1, green: 99/255, blue: 249/255),
        Color(red: 19/255, green: 77/255, blue: 227/255),
        Color(red: 1, green: 99/255, blue: 249/255),
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Notes")
                .font(.system(size: 18))

            ForEach(Array(notes.enumerated()), id: \.offset) { offset, item in
                NoteCardItem(color: self.colors[offset], title: item)
                    .onTapGesture {
                        selection = .notes
                        print("tapped")

                    }
            }
                       
        }
    }
}

struct NotesSectionView_Previews: PreviewProvider {
    static var previews: some View {
        NotesSectionView(selection: .constant(.home))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
