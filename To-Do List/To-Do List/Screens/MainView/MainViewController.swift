//
//  MainViewController.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    // Variables
    var interactor: MainViewInteractorProtocol?
    var router: MainViewRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.viewDidLoad()
    }
    
}

// MARK: - Extensions
extension MainViewController: MainViewProtocol {
    func handleOutput(_ output: MainViewPresenterOutput) {
        
    }
    
}
