//
//  CalendarCoreVM.swift
//  eduFlix
//
//  Created by Reya on 24.04.22.
//

import Foundation
import CoreData

class CalendarCoreVM : ObservableObject {
    private let container: NSPersistentContainer
    @Published var calendarCoreItems:[DeadLineEntity] = []
    
    init () {
        self.container = NSPersistentContainer(name: "CalendarDataModel")
        container.loadPersistentStores { descr, error in
            if let error = error {
                print("Error loading container \(error)")
            } else {
                print("core data loaded")
            }
        }
        
        loadCoreData()
        
       
    }
    
    
    func addDeadline(title:String,date:Date) {

        let item = DeadLineEntity(context: container.viewContext)
        item.heading = title
        item.id = UUID()
        item.date = date
        saveCoreData()
        loadCoreData()
    }
    
    
    private func saveCoreData() {
        do {
            try self.container.viewContext.save()
        } catch {
            print("Error saving core data")
        }
    }
    
    private func loadCoreData() {
        let request = NSFetchRequest<DeadLineEntity>(entityName: "DeadLineEntity")
        do {
            self.calendarCoreItems = try self.container.viewContext.fetch(request)
        } catch {
            print("error loading core data \(#function)")
        }
        
    }
    
}

