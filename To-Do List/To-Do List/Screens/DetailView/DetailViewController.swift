//
//  DetailViewController.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import UIKit

class DetailViewController: UIViewController {
    // Variables
    var interactor: DetailViewInteractorProtocol?
    var router: DetailViewRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.viewDidLoad()
    }
    
}

// MARK: - Extensions
extension DetailViewController: DetailViewProtocol {
    func handleOutput(_ output: DetailViewPresenterOutput) {
        
    }
    
}
