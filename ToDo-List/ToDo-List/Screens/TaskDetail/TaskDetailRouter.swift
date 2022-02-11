//
//  TaskDetailRouter.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailRouter: TaskDetailRouterProtocol {
    weak var viewController: TaskDetailViewController?
    var dataStore: TaskDetailDataStoreProtocol?

    func navigate(to route: TaskDetailRoute) {
        switch route {
        case .showTaskList:
            viewController?.navigationController?.popViewController(animated: true)
        }
    }
}
