//
//  AppDelegate.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
 /*  //создание мануально записи в базу данных
            let course = Course(context: managedObjectContext)
            course.name = "IER"
            
            saveContext()  */
        
        // извлечение сущности (можно и удаление всех или части)
        //let fetchRequest = Student.fetchRequest()
        let fetchRequest = Course.fetchRequest()
        let results = try? managedObjectContext.fetch(fetchRequest)
        results?.forEach({ cus in
           // print(cus.name)
        /*  - если вместо print написать это - то удали всех customer 
            managedObjectContext.delete(cus)
            saveContext()
         */
                            // удалить по фамилии
                        /*  if cus.lastname == "Bruce" {
                            managedObjectContext.delete(cus)}
                            saveContext()  */
            
        })

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "Dovnar_Students_CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
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

