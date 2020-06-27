//
//  CubbyApp.swift
//  Shared
//
//  Created by Sabrina Jain on 6/24/20.
//

import SwiftUI
import CoreData

@main
struct CubbyApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environment(\.managedObjectContext, persistentContainer.viewContext)
            }
            
        }
        var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "Cubby")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
            
        func saveContext() {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    }

