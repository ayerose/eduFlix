//
//  UnitTestingTodoView.swift
//  eduFlix
//
//  Created by Reya on 01.05.22.
//

import SwiftUI


struct UnitTestingNotes: View {
    
    @StateObject private var vm: UnitTestingNotesViewModel
    
    
    init(revealImagePicker : Bool){
        
    _vm = StateObject(wrappedValue: UnitTestingNotesViewModel(revealImagePicker: revealImagePicker))
    }
    var body: some View {
        Text(vm.revealImagePicker.description)
    }
}

struct UnitTestingNotes_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingNotes(revealImagePicker: false)
    }
}
