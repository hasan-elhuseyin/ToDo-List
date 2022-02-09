//
//  CoreDataManager.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    func fetchData() -> [Task]
}

class CoreDataManager {
    
    static let  shared = CoreDataManager()
    
    // *******************************************************************************************************************
    // MARK: - Core Data stack (this code was generated automatically by xcode)
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "To_Do_List")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    // *******************************************************************************************************************

    
}


extension CoreDataManager: CoreDataManagerProtocol {
    func fetchData() -> [Task] {
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        let managedContext = persistentContainer.viewContext
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            return result
        } catch {
            debugPrint("Error while fetching data \(error.localizedDescription)")
            return []
        }
        
    }
    

    // *******************************************************************************************************************
    // MARK: - Core Data Saving support (this code was generated automatically by xcode)
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
    // *******************************************************************************************************************
    
}

