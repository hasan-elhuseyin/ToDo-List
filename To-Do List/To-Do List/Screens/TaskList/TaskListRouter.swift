//
//  MainViewRouter.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import Foundation

class MainViewRouter: MainViewRouterProtocol  {
    
    weak var viewController: MainViewProtocol?
    var dataStore: MainViewInteractorProtocol?
    
}
