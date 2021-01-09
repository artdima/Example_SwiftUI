//
//  ContentView.swift
//  CoreDataExample
//
//  Created by Medyannik Dmitri on 09.01.2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: false)])
    private var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    Text(task.title ?? "Untitle")
                        .onTapGesture(count: 1, perform: {
                            updateTask(task)
                        })
                }.onDelete(perform: deleteTask)
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing: Button("Add task", action: {
                addTask()
            }))
        }
    }
    
    private func addTask() {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.title = "New Task \(Date())"
            newTask.date = Date()
            saveContext()
        }
    }
    
    private func deleteTask(offset: IndexSet) {
        withAnimation {
            offset.map { tasks[$0] }.forEach { viewContext.delete($0) }
            saveContext()
        }
    }
    
    private func updateTask(_ task: FetchedResults<Task>.Element) {
        withAnimation {
            task.title = "Update title"
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved error: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
