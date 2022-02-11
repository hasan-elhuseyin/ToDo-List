//
//  TaskDetailViewController.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import UIKit

class TaskDetailViewController: UIViewController, TaskDetailViewProtocol {

    var interactor: TaskDetailInteractorProtocol?
    var router: TaskDetailRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
    }

    func handleOutput(_ output: TaskDetailPresenterOutput) {
//        switch output {
//        case .showTask(let task):
//            artistNameLabel.text = task.artistName
//            taskNameLabel.text = task.title
//            imageView.kf.setImage(with: task.imageURL)
//        }
    }
    
    
}
