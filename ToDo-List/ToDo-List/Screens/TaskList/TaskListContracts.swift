//
//  TaskListContracts.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

// MARK: - Enums
enum TaskListPresenterOutput {
    case showTaskList([Task])
}

enum TaskListRoute {
    case showNewTaskDetail
    case showEditTaskDetail(index: Int)
}

enum TaskListInteractorOutput {
    case showTaskList([Task])
}

// MARK: - Protocols
protocol TaskListViewControllerProtocol: NSObject {
    func handleOutput(_ output: TaskListPresenterOutput)
}

protocol TaskListInteractorProtocol {
    func viewDidLoad()
}

protocol TaskListPresenterProtocol {
    func handeOutput(_ output: TaskListInteractorOutput)
}

protocol TaskListDataStoreProtocol {
    var tasks: [Task] { get set }
}

typealias TaskListRouterProtocol = TaskListRoutingProtocol & TaskListDataPassingProtocol

protocol TaskListRoutingProtocol {
    func navigate(to route: TaskListRoute)
}

protocol TaskListDataPassingProtocol {
    var dataStore: TaskListDataStoreProtocol? { get }
}


