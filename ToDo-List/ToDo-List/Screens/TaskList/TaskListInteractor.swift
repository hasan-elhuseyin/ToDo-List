//
//  TaskListInteractor.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListInteractor: TaskListInteractorProtocol, TaskListDataStoreProtocol {
    var presenter: TaskListPresenterProtocol?
    var coreDataManager = CoreDataManager.shared
    var tasks: [Task] = []
    var tasksAreSorted = false

    func viewDidLoad() {
        getTasks()
    }
    
    func didDeleteTask(task: Task) {
        coreDataManager.deleteData(task: task)
        tasks = coreDataManager.fetchData()
        self.presenter?.handeOutput(.showTaskList(tasks))
    }
    
    func didSortTasks() {
        // If the tasks are NOT sorted, sort them
        if !tasksAreSorted {
            tasks = coreDataManager.sortByCreationDate()
            self.presenter?.handeOutput(.showTaskList(tasks))
            tasksAreSorted = true
        }else {
            // If the tasks are sorted, fetchData normally
            tasks = coreDataManager.fetchData()
            self.presenter?.handeOutput(.showTaskList(tasks))
            tasksAreSorted = false
        }
        
    }
    
    
    func getTasks() {
        tasks = coreDataManager.fetchData()
        self.presenter?.handeOutput(.showTaskList(tasks))
    }
}
