//
//  TaskListRouter.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListRouter: TaskListRouterProtocol {
    weak var viewController: TaskListViewController?
    var dataStore: TaskListDataStoreProtocol?

    func navigate(to route: TaskListRoute) {
        switch route {
        case .showNewTaskDetail:
            let destinationVC = TaskListBuilder.build()
            viewController?.show(destinationVC, sender: nil)
        case .showEditTaskDetail(_):
            let destinationVC = TaskDetailBuilder.build()
            viewController?.show(destinationVC, sender: nil)
//            if let tasks = dataStore?.tasks {
//                let task = tasks[index]
//
//                //let destinationVC = TaskDetailBuilder.build(with: task)
//                let destinationVC = TaskDetailBuilder.build()
//                var destinationDataStore = destinationVC.router?.dataStore
//
//                destinationDataStore?.task = task
//                viewController?.show(destinationVC, sender: nil)
//            }
        }
    }
}
