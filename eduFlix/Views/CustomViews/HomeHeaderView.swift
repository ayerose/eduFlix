//
//  HomeHeaderView.swift
//  eduFlix
//
//  Created by Soreya Koura on 26.04.22.
import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        
        ZStack(alignment: .leading) {
            Color("heroColor")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image("2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 267, height: 124, alignment: .center)
                        .padding(.top, 30)
                    Spacer()
                }
                
                
                Text("Welcome back\nSam!")
               
                    .textCase(.uppercase)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(.leading, 37)
                    .multilineTextAlignment(.leading)
                
                
                
                Text("Ready to study?")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding(.leading, 37)
                    .padding(.vertical, 10)
                
                
                
            }           
            .clipped()
        }
        
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
            .previewLayout(.sizeThatFits)
    }
}
