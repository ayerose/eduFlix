//
//  UnitTestingTodoViewModel.swift
//  eduFlix
//
//  Created by Reya on 01.05.22.
//

import Foundation
import SwiftUI

class UnitTestingTodoViewModel : ObservableObject {
    
    @Published var showAddToDoView : Bool
    
    init(showAddToDoView: Bool) {
        self.showAddToDoView = showAddToDoView
    }
    
}
