//
//  TaskListController.swift
//  To-Do List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import UIKit

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // Variables
    var interactor: TaskListInteractorProtocol?
    var router: TasksListRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.viewDidLoad()
        // Register the cell so we can dequeue it later.
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }
    
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        router?.navigate(to: .showDetailViewDirectly)
        
    }
    
}

// MARK: - Extensions
// TaskListProtocol extension
extension TaskListViewController: TaskListProtocol {
    func handleOutput(_ output: TaskListPresenterOutput) {
        
    }
}

extension TaskListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigate(to: .showDetailView(index: indexPath.row))
    }
    
}

extension TaskListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
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
