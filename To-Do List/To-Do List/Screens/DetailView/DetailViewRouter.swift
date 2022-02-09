//
//  DetailViewRouter.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class DetailViewRouter: DetailViewRouterProtocol  {
    
    weak var viewController: DetailViewProtocol?
    var dataStore: DetailViewInteractorProtocol?
    
}
