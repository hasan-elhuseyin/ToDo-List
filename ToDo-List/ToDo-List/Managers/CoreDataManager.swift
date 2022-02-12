//
//  CoreDataManager.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation
import CoreData

// MARK: - Protocol
protocol CoreDataManagerProtocol {
    func fetchAllTasks() -> [Task]
    func saveTask(title: String, detail: String, creationDate: Date, completionDate: Date)
    func deleteData(task: Task)
}


// MARK: - CoreDataManager class
class CoreDataManager {
    static let  shared = CoreDataManager()
    
    // Core Data stack (this code was generated automatically by xcode)
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDo_List")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

}


// MARK: - Extension
extension CoreDataManager: CoreDataManagerProtocol {
    // Function for fetching all the tasks from CoreData model
    func fetchAllTasks() -> [Task] {
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        let managedContext = persistentContainer.viewContext
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            return result
        } catch {
            debugPrint("Error while fetching data: \(error.localizedDescription)")
            return []
        }
        
    }
    
    // Function for saving data to CoreData model
    func saveTask(title: String, detail: String, creationDate: Date, completionDate: Date) {
        let managedContext = persistentContainer.viewContext
        let task = Task(context: managedContext)
        task.title = title
        task.detail = detail
        task.creationDate = Date()
        task.completionDate = completionDate
        do {
            if managedContext.hasChanges{
                try  managedContext.save()
                print("Data saved successfully!")
            }
        } catch  {
            debugPrint("Error while saving data: \(error.localizedDescription)")
        }
    }
    
    // Function for deleting a task
    func deleteData(task : Task) {
        let manageContext = persistentContainer.viewContext
        manageContext.delete(task)
        do {
            try  manageContext.save()
            print("Task deleted")
        } catch  {
            debugPrint("Task deletion error: \(error.localizedDescription)")
        }
    }
    
    // Function for updating a task
    func updateData(task : Task, title : String, detail : String, date : Date) {
        let manageContext = persistentContainer.viewContext
        task.title = title
        task.detail = detail
        task.completionDate = date
        task.creationDate = Date()
        do {
            if manageContext.hasChanges{
                try manageContext.save()
            }
        } catch  {
            debugPrint("Error while updating data \(error.localizedDescription)")
        }
    }
    
    // Function for sorting the tasks
    func sortByCreationDate() -> [Task] {
        let manageContext = persistentContainer.viewContext
        let request = NSFetchRequest<Task>(entityName: "Task")
        let sorter = NSSortDescriptor(key: "creationDate", ascending: false)
        request.sortDescriptors = [sorter]
        request.returnsObjectsAsFaults = false
        do {
            let result = try manageContext.fetch(request)
            return result
        } catch {
            debugPrint("Error in sorting function \(error.localizedDescription)")
        }
        return []
    }
    
    // Function for searching a task
    func searchTask(searchText : String) -> [Task]{
        let manageContext = persistentContainer.viewContext
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(format: "title contains[c] '\(searchText)'")
        do {
            let data = try manageContext.fetch(request)
            return data
        } catch  {
            debugPrint("Error in searching function \(error.localizedDescription)")
        }
        return []
    }
    
    // Core Data Saving support
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

