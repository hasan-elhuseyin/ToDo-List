//
//  TaskDetailBuilder.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailBuilder {
    
    // MARK: - build function for the normal build requests
    static func build() -> TaskDetailViewController {
        let viewController = TaskDetailViewController(nibName: "TaskDetailViewController", bundle: nil)
        let interactor = TaskDetailInteractor()
        let presenter = TaskDetailPresenter()
        let router = TaskDetailRouter()
        
        let notificationManager = LocalNotificationManager()
        interactor.notificationManager = notificationManager
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
    
    // MARK: - build function for the build requests that passes a task
    static func build(with task: Task) -> TaskDetailViewController {
        let viewController = TaskDetailViewController(nibName: "TaskDetailViewController", bundle: nil)
        let interactor = TaskDetailInteractor()
        let presenter = TaskDetailPresenter()
        let router = TaskDetailRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        interactor.task = task
        viewController.realTask = task
        
        return viewController
    }
}
