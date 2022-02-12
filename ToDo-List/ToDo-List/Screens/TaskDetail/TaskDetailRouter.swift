//
//  TaskDetailRouter.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailRouter: TaskDetailRouterProtocol {
    // MARK: VIP connections
    weak var viewController: TaskDetailViewController?
    var dataStore: TaskDetailDataStoreProtocol?
    
    // Navigate function
    func navigate(to route: TaskDetailRoute) {
        switch route {
        case .showTaskList:
            viewController?.navigationController?.popViewController(animated: true)
        }
    }
}
