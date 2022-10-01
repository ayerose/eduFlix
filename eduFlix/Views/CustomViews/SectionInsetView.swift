//
//  SectionInsetView.swift
//  eduFlix
//
//  Created by Soreya Koura on 26.04.22.
//
import SwiftUI

struct SectionInsetView: View {
    @State private var showingSheet = false
    var body: some View {
        
        HStack {
            Text("RECENTS")
                .font(.system(size: 20))
                .foregroundColor(Color(red: 252/255, green: 163/255, blue: 17/255))
            Spacer()
            HStack(spacing: 20) {
               
               
                Button {
                    print("calendar")
                    showingSheet.toggle()
                
                } label: {
                    Image("calendarIcon")
                        .scaleEffect(1.3)

                }
                .sheet(isPresented: $showingSheet) {
                    CalendarView()
                }
                }
                
                Button {
                    print("filter")
                } label: {
                    Image("filterIcon")
                        .scaleEffect(1.3)

                }

                Button {
                    print("search")
                } label: {
                    Image("search")
                        .scaleEffect(1.3)

                }
            }
            .foregroundColor(Color.blue)
        
    }
}

struct SectionInsetView_Previews: PreviewProvider {
    static var previews: some View {
        SectionInsetView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
