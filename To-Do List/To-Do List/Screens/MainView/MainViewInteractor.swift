//
//  MainViewInteractor.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class MainViewInteractor: MainViewInteractorProtocol, TasksListDataStoreProtocol {
    
    var presenter: MainViewPresenterProtocol?
    var tasks: [Task] = []
    
    func viewDidLoad() {
        // getTasksList()
    }
    
//    func getTasksList() {
//
//    }
    
}
