//
//  TaskListPresenter.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListPresenter {
    
    weak var viewController: TaskListViewControllerProtocol?
    
    
}

// MARK: - Extensions
extension TaskListPresenter: TaskListPresenterProtocol {
    func handleOutput(_ output: TaskListInteractorOutput) {
        
    }
    
    
}
