//
//  TaskListInteractor.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListInteractor: TaskListInteractorProtocol, TaskListDataStoreProtocol {
    var presenter: TaskListPresenterProtocol?

//    var tasks: [Task] = []
//    let networkWorker: ClientNetworkServiceProtocol
//
//    init(networkWorker: ClientNetworkServiceProtocol) {
//        self.networkWorker = networkWorker
//    }

    func viewDidLoad() {
        getTasks()
    }

    func getTasks() {
//        networkWorker.tasks { [weak self] response, error in
//            guard let self = self else { return }
//            guard let response = response else { return }
//            let tasks = response.feed.tasks
//            self.tasks = tasks
//            self.presenter?.handeOutput(.showTaskList(tasks))
//        }
    }
}
