//
//  UnitTestingTodoView.swift
//  eduFlix
//
//  Created by Reya on 01.05.22.
//

import SwiftUI


struct UnitTestingTodoView: View {
    
    @StateObject private var vm: UnitTestingTodoViewModel
    
    
    init(showAddToDoView : Bool){
        
    _vm = StateObject(wrappedValue: UnitTestingTodoViewModel(showAddToDoView: showAddToDoView))
    }
    var body: some View {
        Text(vm.showAddToDoView.description)
    }
}

struct UnitTestingTodoView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingTodoView(showAddToDoView: false)
    }
}
