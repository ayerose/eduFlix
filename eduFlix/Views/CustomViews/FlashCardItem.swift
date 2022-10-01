//
//  FlashCardItem.swift
//  eduFlix
//
//  Created by Soreya Koura on 26.04.22.
//
import SwiftUI

struct FlashCardItem: View {
    
    let cardTitle: String
    let cardCount: Int
    let color: Color
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cardTitle)
                    .font(.system(size: 24))
                Text("\(cardCount) cards")
                    .font(.system(size: 12))
            }
            .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .background(color)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 4)

    }
}

struct FlashCardItem_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardItem(cardTitle: "Exam Preparation", cardCount: 20, color: .purple)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
