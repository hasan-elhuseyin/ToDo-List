//
//  MainViewContracts.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

enum MainViewPresenterOutput {
    //func showTasksList([TasksPresentation])
}

protocol MainViewProtocol: NSObject {
    func handleOutput(_ output: MainViewPresenterOutput)
}

protocol MainViewInteractorProtocol {
    func viewDidLoad()
}

protocol MainViewRouterProtocol {
    
}

enum MainViewInteractorOutput {
    //func showTasksList([Task])
}

protocol MainViewPresenterProtocol {
    func handleOutput(_ output: MainViewInteractorOutput)
}
