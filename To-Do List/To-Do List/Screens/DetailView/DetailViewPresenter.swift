//
//  DetailViewPresenter.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class DetailViewPresenter {
    
    weak var viewController: DetailViewProtocol?
    
    
}

// MARK: - Extensions
extension DetailViewPresenter: DetailViewPresenterProtocol {
    func handleOutput(_ output: DetailViewInteractorOutput) {
        
    }
    
    
}
