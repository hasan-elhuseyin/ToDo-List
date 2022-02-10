//
//  TaskDetailContracts.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

enum TaskDetailPresenterOutput {
    //func showTasksList([TasksPresentation])
}

protocol TaskDetailViewControllerProtocol: NSObject {
    func handleOutput(_ output: TaskDetailPresenterOutput)
}

protocol TaskDetailInteractorProtocol {
    func viewDidLoad()
}

protocol TaskDetailRouterProtocol {
    
}

enum TaskDetailInteractorOutput {
    case showTasksList([Task])
}

protocol TaskDetailPresenterProtocol {
    func handleOutput(_ output: TaskDetailInteractorOutput)
}
