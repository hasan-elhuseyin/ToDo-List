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
protocol TaskListViewControllerProtocol: NSObject {
    func handleOutput(_ output: TaskListPresenterOutput)
}

protocol TaskListInteractorProtocol {
    func viewDidLoad()
}

protocol TaskListPresenterProtocol {
    func handleOutput(_ output: TaskListInteractorOutput)
}

typealias TaskListRouterProtocol = TaskListRoutingProtocol & TaskListDataPassingProtocol

protocol TaskListRoutingProtocol {
    func navigate(to route: TasksListRoute)
}

protocol TaskListDataPassingProtocol {
    var dataStore: TaskListDataStoreProtocol? { get }
}

protocol TaskListDataStoreProtocol {
    var tasks: [Task] { get set }
}
