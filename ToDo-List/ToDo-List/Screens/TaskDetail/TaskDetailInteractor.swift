//
//  TaskDetailInteractor.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailInteractor: TaskDetailInteractorProtocol, TaskDetailDataStoreProtocol {
    
    var presenter: TaskDetailPresenterProtocol?
    var coreDataManager = CoreDataManager.shared

    var task: Task?

    func viewDidLoad() {
        guard let task = task else { return }
        self.presenter?.handeOutput(.showTask(task))
    }
    
    func didSaveData(title: String, detail: String, completionDate: Date, creationDate: Date) {
        coreDataManager.saveData(title: title, detail: detail, creationDate: creationDate, completionDate: completionDate)
    }
    
    
}
