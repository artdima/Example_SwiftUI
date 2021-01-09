//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by Medyannik Dmitri on 09.01.2021.
//

import SwiftUI

@main
struct CoreDataExampleApp: App {
    
    let persistenceContainer = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
