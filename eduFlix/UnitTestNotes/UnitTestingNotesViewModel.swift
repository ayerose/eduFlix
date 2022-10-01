//
//  UnitTestingNotesiewModel.swift
//  eduFlix
//
//  Created by Reya on 01.05.22.
//

import Foundation
import SwiftUI

class UnitTestingNotesViewModel : ObservableObject {
    
    @Published var revealImagePicker : Bool
    
    init(revealImagePicker: Bool) {
        self.revealImagePicker = revealImagePicker
    }
    
}
