//
//  TaskListPresenter.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListPresenter: TaskListPresenterProtocol {
    // MARK: - Variables
    weak var viewController: TaskListViewControllerProtocol?
    
    // MARK: - Functions
    func handeOutput(_ output: TaskListInteractorOutput) {
        switch output {
        case .showTaskList(let tasks):
            viewController?.handleOutput(.showTaskList(tasks))
        }
    }
}
