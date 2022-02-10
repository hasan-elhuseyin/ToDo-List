//
//  MainViewRouter.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class MainViewRouter: TasksListRouterProtocol {
        
    weak var viewController: MainViewController?
    var dataStore: TasksListDataStoreProtocol?
    
    func navigate(to route: TasksListRoute) {
        switch route {
        case .showDetailViewDirectly:
            let destinationVC = DetailViewBuilder.build()
            print("now you should be redirected")
            viewController?.show(destinationVC, sender: nil)
        case .showDetailView(let index):
            if let tasks = dataStore?.tasks {
                let task = tasks[index]

                let destinationViewController = MainViewBuilder.build()
                var destinationDataStore = destinationViewController.router?.dataStore

                destinationDataStore?.tasks = [task]
                
                

                viewController?.show(destinationViewController, sender: nil)
            }

        }
    }
}
