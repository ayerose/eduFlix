//
//  UnitTestingFlashcardsViewModel.swift
//  eduFlix
//
//  Created by Reya on 01.05.22.
//

import Foundation
import SwiftUI

class UnitTestingFlashcardsViewModel : ObservableObject {
    
    @Published var showAnswer : Bool
    
    init(showAnswer: Bool) {
        self.showAnswer = showAnswer
    }
    
}
