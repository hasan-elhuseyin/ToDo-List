//
//  DetailViewBuilder.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class DetailViewBuilder {
    
    static func build() -> DetailViewController {
        let viewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        let interactor = DetailViewInteractor()
        let presenter = DetailViewPresenter()
        let router = DetailViewRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
    
}
