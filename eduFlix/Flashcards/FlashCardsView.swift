//
//  FlashCardsView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.
//

import SwiftUI

struct FlashCardsView: View {
    
    let card: Card
    var removal: (() -> Void)? = nil
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                
                     RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(offset.width > 0 ? .green : .red )
                )
                .shadow(radius: 10)
            
            VStack {
                if voiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.title2)
                        .foregroundColor(.black)
                } else {
                    Text(card.prompt)
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        // - MARK: Swipe effect
        
        .frame(width: 450, height: 250)
        //rotation
        .rotationEffect(.degrees(Double(offset.width / 3)))
        .offset(x: offset.width * 3, y: 0)
        //fade
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
        DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
                feedback.prepare()
            }
        
            .onEnded { _ in
                if abs(offset.width) > 100 {
                    if offset.width > 0 {
                        feedback.notificationOccurred(.success)
                    } else {
                        feedback.notificationOccurred(.error)
                    }
                    
                    removal?()
                } else {
                    offset = .zero
                }
            }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring(), value: offset)
    }
}

struct FlashCardsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardsView(card: Card.example)
    }
}
