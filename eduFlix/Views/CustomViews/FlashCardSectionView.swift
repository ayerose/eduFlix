//
//  FlashCardSectionView.swift
//  eduFlix
//
//  Created by Soreya Koura on 26.04.22.
//

import SwiftUI

struct FlashCardSectionView: View {
    
    @Binding var selection: Tab
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Flashcards")
                .padding(.bottom, 13)
            
            VStack(alignment: .center, spacing: 25) {
                FlashCardItem(cardTitle: "Exam Preparation", cardCount: 20, color: .teal)
                    .onTapGesture {
                        selection = .flashcards
                        print("tapped")
                    }
                    .frame(height: 57, alignment: .center)
                
                FlashCardItem(cardTitle: "UX Fundamentals", cardCount: 10, color: .purple)
                    .onTapGesture {
                        selection = .flashcards
                        print("tapped")

                    }
            }
        }
    }
}

struct FlashCardSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardSectionView(selection: .constant(.home))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
