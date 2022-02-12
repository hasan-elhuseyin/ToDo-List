//
//  TaskListRouter.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation
import UIKit

class TaskListRouter: TaskListRouterProtocol {
    // MARK: - VIP connections
    weak var viewController: TaskListViewController?
    var dataStore: TaskListDataStoreProtocol?
    
    // navigate function
    func navigate(to route: TaskListRoute) {
        switch route {
        // Shows a blank TaskDetail screen
        case .showNewTaskDetail:
            let destinationVC = TaskDetailBuilder.build()
            viewController?.show(destinationVC, sender: nil)
            return
        // Shows a filled TaskDetail screen
        case .showEditTaskDetail(index: let index):
            if let tasks = dataStore?.tasks {
                let task = tasks[index]
                let destinationVC = TaskDetailBuilder.build(with: task)
                var destinationDataStore = destinationVC.router?.dataStore
                destinationDataStore?.task = task
                viewController?.show(destinationVC, sender: nil)
                return
            }
            
        }
    }
    
}
