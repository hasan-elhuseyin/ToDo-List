//
//  TaskListViewController.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import UIKit

class TaskListViewController: UIViewController, TaskListViewControllerProtocol {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
        }
    }
    
    var interactor: TaskListInteractorProtocol?
    var router: TaskListRouterProtocol?
    
    // private var tasks: [taskListPresentation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
        
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }

    func handleOutput(_ output: TaskListPresenterOutput) {
//        switch output {
//        case .showTaskList(let tasks):
//            self.tasks = tasks
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        router?.navigate(to: .showNewTaskDetail)
    }
    
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigate(to: .showEditTaskDetail(index: indexPath.row))
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        cell.titleLabel.text = "Test title"
        cell.detailLabel.text = "This is a test for the label of the TaskCell inside the tableview"
        cell.completionDate.text = "10/02/2022"
        return cell
    }
}


