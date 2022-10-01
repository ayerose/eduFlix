//
//  CalendarModelItem.swift
//  eduFlix
//
//  Created by Reya on 23.04.22.
//

import Foundation



struct CalendarModelItem : Identifiable {
    let id = UUID()
    let weekDay:Int
    let date:Date
    var isSelected:Bool = false
}
