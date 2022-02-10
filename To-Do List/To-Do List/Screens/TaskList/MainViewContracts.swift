//
//  TaskListContracts.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

// MARK: - Enums
enum TaskListPresenterOutput {
    //func showTasksList([TasksPresentation])
}

enum TaskListInteractorOutput {
    case showTasksList([Task])
}

enum TasksListRoute {
    case showDetailViewDirectly
    case showDetailView(index: Int)
}

// MARK: - Protocols
protocol TaskListProtocol: NSObject {
    func handleOutput(_ output: TaskListPresenterOutput)
}

protocol TaskListInteractorProtocol {
    func viewDidLoad()
}

protocol TaskListRoutingProtocol {
    func navigate(to route: TasksListRoute)
}

protocol TaskListPresenterProtocol {
    func handleOutput(_ output: TaskListInteractorOutput)
}

typealias TasksListRouterProtocol = TaskListRoutingProtocol & TaskListDataPassingProtocol

protocol TasksListDataStoreProtocol {
    var tasks: [Task] { get set }
}

protocol TaskListDataPassingProtocol {
    var dataStore: TasksListDataStoreProtocol? { get }
}
