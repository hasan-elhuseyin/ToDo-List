//
//  TaskListPresenter.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class TaskListPresenter: TaskListPresenterProtocol {
    weak var viewController: TaskListViewControllerProtocol?

    func handeOutput(_ output: TaskListInteractorOutput) {
//        switch output {
//        case .showTaskList(let tasks):
//            viewController?.handleOutput(.showTaskList(tasks.map(TaskListPresentation.init)))
//        }
    }
}
