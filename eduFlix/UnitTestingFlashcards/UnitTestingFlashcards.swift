///
//  UnitTestingTodoView.swift
//  eduFlix
//
//  Created by Reya on 01.05.22.
//

import SwiftUI


struct UnitTestingFlashcards: View {
    
    @StateObject private var vm: UnitTestingFlashcardsViewModel
    
    
    init(showAnswer : Bool){
        
    _vm = StateObject(wrappedValue: UnitTestingFlashcardsViewModel(showAnswer: showAnswer))
    }
    var body: some View {
        Text(vm.showAnswer.description)
    }
}

struct UnitTestingFlashcards_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingFlashcards(showAnswer: false)
    }
}

