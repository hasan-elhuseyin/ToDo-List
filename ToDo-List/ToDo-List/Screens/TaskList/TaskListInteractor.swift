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

    func viewDidLoad() {
        getTasks()
    }
    
    func didDeleteRow(task: Task) {
        coreDataManager.deleteData(task: task)
        tasks = coreDataManager.fetchData()
        self.presenter?.handeOutput(.showTaskList(tasks))
    }
    
    
    func getTasks() {
        tasks = coreDataManager.fetchData()
        self.presenter?.handeOutput(.showTaskList(tasks))
    }
}
