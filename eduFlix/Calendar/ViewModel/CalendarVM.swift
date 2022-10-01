//
//  CalendarVM.swift
//  eduFlix
//
//  Created by Reya on 23.04.22.
//


import Foundation

class CalendarVM : ObservableObject {
    
    @Published var calendar : [CalendarModelItem] = []
    @Published var date : Date = Date()
    @Published var selectedD:Date = Date()
    
    
    
    
    init () {
        getDaysFromMonth()
    }
    
    func selectDate(item:CalendarModelItem) {
        let first = self.calendar.firstIndex { it in
            it.isSelected
        }
        
        if let first = first {
            self.calendar[first].isSelected = false
        }
        
        
        let second = self.calendar.firstIndex { it in
            it.id == item.id
        }
        
        if let second = second {
            self.calendar[second].isSelected = true
            self.selectedD = self.calendar[second].date
        }
        
        
    }
    
    func moveDate(past:Bool) {
        let cal = Calendar.current
        let newDate = cal.date(byAdding: .month, value: past ? -1 : 1, to: self.date)
        
        if let newDate = newDate {
            self.date = newDate
        }
        
        getDaysFromMonth()
    }
    
    func getMonthYearString() -> String {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_EN") as Locale?
        formatter.dateFormat = "LLLL YYYY"
        
        return formatter.string(from: self.date)
    }
    
    func getDayMonthYearString() -> String {
        
        let second = self.calendar.firstIndex { it in
            it.isSelected
        }
        
        guard let second = second else {
            return ""
        }
        
        let selDate:Date = self.calendar[second].date
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_EN") as Locale?
        formatter.dateFormat = "LLLL YYYY"
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        numberFormatter.locale = NSLocale(localeIdentifier: "en_EN") as Locale?
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"

        let dayString = dayFormatter.string(from: selDate)

        // Add the suffix to the day
        let dayNumber = NSNumber(value: Int(dayString)!)
        let day = numberFormatter.string(from: dayNumber)!
        
        let result = "\(day) \(formatter.string(from: selDate))"
        
        
        
        return result
    }
    
    func isCurrentMonth(item1:CalendarModelItem) -> Bool {
        let cal = Calendar.current
        let comp1 = cal.dateComponents([.month], from: item1.date)
        let comp2 = cal.dateComponents([.month], from: self.date)
        if let comp1 = comp1.month, let comp2 = comp2.month {
            return comp1 == comp2
        }
        
        return false
    }
    
    
    
    private func getDaysFromMonth() {
        self.calendar.removeAll()
        
        var cal :Calendar = Calendar(identifier: .gregorian)
        cal.firstWeekday = 2
        let comp : DateComponents = cal.dateComponents([.weekday,.day,.month,.year], from: date)
        let compC : DateComponents = cal.dateComponents([.weekday,.day,.month,.year], from: Date.now) // load today for selected
        
        
        let weekInY = cal.range(of: .weekOfYear, in: .month, for: date)
        if let weekInY = weekInY {
            
            if let first = weekInY.first {
                let newDate = cal.date(from: .init(year: comp.year,weekday: 2, weekOfYear: first))
                if let newDate = newDate {
                        
                        for i in 0..<35 {
                            let newDay = cal.date(byAdding: .day, value: i, to: newDate)
                            if let newDay = newDay {
                                let newDayComp = cal.dateComponents([.day,.month,.year], from: newDay)
                                if let day = newDayComp.day,let mon = newDayComp.month, let year = newDayComp.year{
                                    if let currentDay = compC.day,let currentMonth = compC.month, let currentYear = compC.year {
                                        self.calendar.append(CalendarModelItem(weekDay: day, date: newDay, isSelected: currentDay == day && currentMonth == mon && currentYear == year))
                                        if currentDay == day && currentMonth == mon && currentYear == year {
                                            self.selectedD = newDay
                                        }
                                    }
                                    
                                }
                            }
                        }
                    
                }
            }
        }
    }
}
