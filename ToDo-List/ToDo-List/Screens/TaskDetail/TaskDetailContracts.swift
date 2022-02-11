//
//  TaskDetailContracts.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

enum TaskDetailPresenterOutput {
    case showTask(TaskDetailPresentation)
}

protocol TaskDetailViewProtocol: NSObject {
    func handleOutput(_ output: TaskDetailPresenterOutput)
}

protocol TaskDetailInteractorProtocol {
    func viewDidLoad()
}

enum TaskDetailRoute {
    case showTaskList
}

typealias TaskDetailRouterProtocol = TaskDetailRoutingProtocol & TaskDetailDataPassingProtocol

protocol TaskDetailDataStoreProtocol {
    var task: Task? { get set }
}

protocol TaskDetailDataPassingProtocol {
    var dataStore: TaskDetailDataStoreProtocol? { get }
}

protocol TaskDetailRoutingProtocol {
    func navigate(to route: TaskDetailRoute)
}

enum TaskDetailInteractorOutput {
    case showTask(Task)
}

protocol TaskDetailPresenterProtocol {
    func handeOutput(_ output: TaskDetailInteractorOutput)
}
