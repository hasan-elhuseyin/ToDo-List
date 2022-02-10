//
//  TaskDetailBuilder.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailBuilder {
    
    static func build() -> TaskDetailViewController {
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
        return viewController
    }
    
}
