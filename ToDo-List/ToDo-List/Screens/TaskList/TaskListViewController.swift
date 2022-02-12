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
    
    private var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
        tableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Reload tableView content if view will appear
        interactor?.viewDidLoad()
        tableView.reloadData()
    }

    func handleOutput(_ output: TaskListPresenterOutput) {
        switch output {
        case .showTaskList(let tasks):
            self.tasks = tasks

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        router?.navigate(to: .showNewTaskDetail)
    }
    
    @IBAction func sortButtonTapped(_ sender: Any) {
        interactor?.didSortTasks()
    }
    
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.navigate(to: .showEditTaskDetail(index: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            interactor?.didDeleteTask(task: tasks[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        cell.titleLabel.text = tasks[indexPath.row].title
        cell.detailLabel.text = tasks[indexPath.row].detail
        let date = tasks[indexPath.row].completionDate
        cell.completionDate.text = configureDate(date: date!)
        return cell
    }
    
    // Function to convert Date to String
    func configureDate(date: Date) -> String {
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        // Set Date Format
        dateFormatter.dateFormat = "dd/MM/yyyy"
        // Convert Date to String
        return dateFormatter.string(from: date)
    }
}

extension TaskListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor?.didSearchTask(searchText: searchText)
    }
}
