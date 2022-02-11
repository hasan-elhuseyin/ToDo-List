//
//  TaskDetailPresenter.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailPresenter: TaskDetailPresenterProtocol {
    weak var viewController: TaskDetailViewProtocol?

    func handeOutput(_ output: TaskDetailInteractorOutput) {
//        switch output {
//        case .showTask(let task):
//            viewController?.handleOutput(.showTask(TaskDetailPresentation(task: task)))
//        }
    }
}
