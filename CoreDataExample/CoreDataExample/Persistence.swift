//
//  Persistence.swift
//  CoreDataExample
//
//  Created by Medyannik Dmitri on 09.01.2021.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error.localizedDescription)")
            }
            
        }
    }
}
