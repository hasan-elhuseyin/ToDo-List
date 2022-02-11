//
//  TaskDetailViewController.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import UIKit

class TaskDetailViewController: UIViewController, TaskDetailViewProtocol {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!

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

    @IBAction func buttonTapped(_ sender: Any) {
        router?.navigate(to: .showTaskList)
    }
}
