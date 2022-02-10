//
//  MainViewContracts.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

// MARK: - Enums
enum MainViewPresenterOutput {
    //func showTasksList([TasksPresentation])
}

enum MainViewInteractorOutput {
    case showTasksList([Task])
}

enum TasksListRoute {
    case showDetailViewDirectly
    case showDetailView(index: Int)
}

// MARK: - Protocols
protocol MainViewProtocol: NSObject {
    func handleOutput(_ output: MainViewPresenterOutput)
}

protocol MainViewInteractorProtocol {
    func viewDidLoad()
}

protocol MainViewRoutingProtocol {
    func navigate(to route: TasksListRoute)
}

protocol MainViewPresenterProtocol {
    func handleOutput(_ output: MainViewInteractorOutput)
}

typealias TasksListRouterProtocol = MainViewRoutingProtocol & TaskListDataPassingProtocol

protocol TasksListDataStoreProtocol {
    var tasks: [Task] { get set }
}

protocol TaskListDataPassingProtocol {
    var dataStore: TasksListDataStoreProtocol? { get }
}
