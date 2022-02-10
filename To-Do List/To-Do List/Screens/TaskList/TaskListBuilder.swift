//
//  TaskListBuilder.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListBuilder {
    static func build() -> TaskListViewController {
        let viewController = TaskListViewController(nibName: "TaskListViewController", bundle: nil)
        let interactor = TaskListInteractor()
        let presenter = TaskListPresenter()
        let router = TaskListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
