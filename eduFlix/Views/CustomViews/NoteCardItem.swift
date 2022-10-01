//
//  NoteCardItem.swift
//  eduFlix
//
//  Created by Soreya Koura on 26.04.22.
//

import SwiftUI

struct NoteCardItem: View {
    
    let color: Color
    let title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Text(title)
                .foregroundColor(color)
            .font(.title)
            
            Spacer()
            
            Image("chevron.right")
                .frame(width: 12.16, height: 18.15, alignment: .center)
        }
    }
}

struct NoteCardItem_Previews: PreviewProvider {
    static var previews: some View {
        NoteCardItem(color: .pink, title: "UX Researches Interviews")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
