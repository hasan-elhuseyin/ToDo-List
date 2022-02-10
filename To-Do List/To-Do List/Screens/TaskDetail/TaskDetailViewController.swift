//
//  DetailViewController.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import UIKit

class TaskDetailViewController: UIViewController {
    // Variables
    var interactor: TaskDetailInteractorProtocol?
    var router: TaskDetailRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.viewDidLoad()
    }
    
}

// MARK: - Extensions
extension TaskDetailViewController: TaskDetailViewControllerProtocol {
    func handleOutput(_ output: TaskDetailPresenterOutput) {
        
    }
    
}
