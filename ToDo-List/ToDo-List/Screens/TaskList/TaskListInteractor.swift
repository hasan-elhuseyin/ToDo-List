//
//  TaskListInteractor.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListInteractor: TaskListInteractorProtocol, TaskListDataStoreProtocol {
    var presenter: TaskListPresenterProtocol?
    var coreDataManager = CoreDataManager.shared
    var tasks: [Task] = []

    func viewDidLoad() {
        getTasks()
    }

    func getTasks() {
        tasks = coreDataManager.fetchData()
        self.presenter?.handeOutput(.showTaskList(tasks))
//        networkWorker.tasks { [weak self] response, error in
//            guard let self = self else { return }
//            guard let response = response else { return }
//            let tasks = response.feed.tasks
//            self.tasks = tasks
//            self.presenter?.handeOutput(.showTaskList(tasks))
//        }
    }
}
