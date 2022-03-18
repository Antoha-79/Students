//
//  CoreDataService.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//

import CoreData // добавил эту строку
import Foundation

final class CoreDataService {   // сюда просто скопировали весь код что ниже из AppDelegate, только добавил static переменным и функции
    
    static var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Dovnar_Students_CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    static func saveContext () {
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
