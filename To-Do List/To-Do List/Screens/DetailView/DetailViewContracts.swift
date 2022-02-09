//
//  DetailViewContracts.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

enum DetailViewPresenterOutput {
    //func showTasksList([TasksPresentation])
}

protocol DetailViewProtocol: NSObject {
    func handleOutput(_ output: DetailViewPresenterOutput)
}

protocol DetailViewInteractorProtocol {
    func viewDidLoad()
}

protocol DetailViewRouterProtocol {
    
}

enum DetailViewInteractorOutput {
    //func showTasksList([Task])
}

protocol DetailViewPresenterProtocol {
    func handleOutput(_ output: DetailViewInteractorOutput)
}
