//
//  MainViewPresenter.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class MainViewPresenter {
    
    weak var viewController: MainViewProtocol?
    
    
}

// MARK: - Extensions
extension MainViewPresenter: MainViewPresenterProtocol {
    func handleOutput(_ output: MainViewInteractorOutput) {
        
    }
    
    
}
