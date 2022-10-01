//
//  HomeView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.
//

import SwiftUI

struct HomeView: View {
  
    @Binding var selection: Tab
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            HomeHeaderView()
                .frame(height: 264)
            SectionInsetView()
                .padding()
            
            
            FlashCardSectionView(selection: $selection)
                .padding()
            
            HStack {
                NotesSectionView(selection: $selection)
                    .padding()
                Spacer()
            }
            
        } //: SCROLL
        .ignoresSafeArea()
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selection: .constant(.home))
    }
}


