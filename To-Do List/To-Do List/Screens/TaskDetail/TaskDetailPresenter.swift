//
//  TaskDetailPresenter.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailPresenter {
    
    weak var viewController: TaskDetailViewControllerProtocol?
    
    
}

// MARK: - Extensions
extension TaskDetailPresenter: TaskDetailPresenterProtocol {
    func handleOutput(_ output: TaskDetailInteractorOutput) {
        
    }
    
    
}
