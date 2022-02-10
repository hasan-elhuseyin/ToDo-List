//
//  TaskListInteractor.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListInteractor: TaskListInteractorProtocol, TaskListDataStoreProtocol {
    
    var presenter: TaskListPresenterProtocol?
    var tasks: [Task] = []
    
    func viewDidLoad() {
        // getTasksList()
    }
    
//    func getTasksList() {
//
//    }
    
}
