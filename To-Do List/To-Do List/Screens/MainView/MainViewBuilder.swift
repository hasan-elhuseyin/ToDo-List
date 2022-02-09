//
//  MainViewBuilder.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class MainViewBuilder {
    
    static func build() -> MainViewController {
        let viewController = MainViewController(nibName: "MainViewController", bundle: nil)
        let interactor = MainViewInteractor()
        let presenter = MainViewPresenter()
        let router = MainViewRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
    
}
