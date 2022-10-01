//
//  HelpUIView.swift
//  eduFlix
//
//  Created by Soreya Koura on 28.04.22.
//
import SwiftUI

struct HelpUIView: View {
    let helps: [Help]
    
    
    
    init() {
        let url = Bundle.main.url(forResource: "Help", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        helps = try! JSONDecoder().decode([Help].self, from: data)
        
    }
    
    
    
    var body: some View {
        // id: \.text as unique id
        List(helps, id: \.text, children: \.children) { help in
            if help.children != nil {
                // show label
                Label(help.text, systemImage: "quote.bubble")
            } else {
                // show
                Text(help.text)
            }
            
        }
        .navigationBarTitle("Profile & Tips")
    }
}



struct TipsUiView_Previews: PreviewProvider {
    static var previews: some View {
        HelpUIView()
    }
    
    
    
    
}
