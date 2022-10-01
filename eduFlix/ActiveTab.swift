//
//  ActiveTab.swift
//  eduFlix
//
//  Created by Soreya Koura on 26.04.22.
//



import SwiftUI


class ActiveTab: ObservableObject {
    @Published var selectedIndex: Int = 0
}


enum Tab {
    case home
    case todos
    case notes
    case profile
    case flashcards
}
