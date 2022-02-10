//
//  TaskDetailRouter.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailRouter: TaskDetailRouterProtocol  {
    
    weak var viewController: TaskDetailViewControllerProtocol?
    var dataStore: TaskDetailInteractorProtocol?
    
}
