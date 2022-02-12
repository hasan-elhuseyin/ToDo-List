//
//  TaskListInteractor.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListInteractor: TaskListInteractorProtocol, TaskListDataStoreProtocol {
    // MARK: - VIP connections
    var presenter: TaskListPresenterProtocol?
    var coreDataManager = CoreDataManager.shared
    
    // MARK: - Variables
    var tasks: [Task] = []
    var tasksAreSorted = false

    func viewDidLoad() {
        getTasks()
    }
    
    //MARK: - Functions
    // Deletion function
    func didDeleteTask(task: Task) {
        coreDataManager.deleteData(task: task)
        tasks = coreDataManager.fetchData()
        self.presenter?.handeOutput(.showTaskList(tasks))
    }
    
    // Sorting function
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
    
    // Searching function
    func didSearchTask(searchText: String) {
        if searchText == "" {
            tasks = coreDataManager.fetchData()
            self.presenter?.handeOutput(.showTaskList(tasks))
            return
        }
        tasks = coreDataManager.searchTask(searchText: searchText)
        self.presenter?.handeOutput(.showTaskList(tasks))
    }
    
    // Get all tasks
    func getTasks() {
        tasks = coreDataManager.fetchData()
        self.presenter?.handeOutput(.showTaskList(tasks))
    }
}
