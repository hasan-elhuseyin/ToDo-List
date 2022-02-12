//
//  TaskDetailContracts.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

// MARK: - Enums
enum TaskDetailPresenterOutput {
    case showTask(TaskDetailPresentation)
}

enum TaskDetailRoute {
    case showTaskList
}

enum TaskDetailInteractorOutput {
    case showTask(Task)
}

// MARK: - Protocols
protocol TaskDetailViewProtocol: NSObject {
    func handleOutput(_ output: TaskDetailPresenterOutput)
}

protocol TaskDetailInteractorProtocol {
    func viewDidLoad()
    func didSaveData(title: String, detail: String, completionDate: Date, creationDate: Date)
}

protocol TaskDetailDataStoreProtocol {
    var task: Task? { get set }
}

protocol TaskDetailPresenterProtocol {
    func handeOutput(_ output: TaskDetailInteractorOutput)
}

typealias TaskDetailRouterProtocol = TaskDetailRoutingProtocol & TaskDetailDataPassingProtocol

protocol TaskDetailDataPassingProtocol {
    var dataStore: TaskDetailDataStoreProtocol? { get }
}

protocol TaskDetailRoutingProtocol {
    func navigate(to route: TaskDetailRoute)
}
