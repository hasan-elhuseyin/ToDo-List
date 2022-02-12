//
//  TaskListViewController.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 9.02.2022.
//

import UIKit

class TaskListViewController: UIViewController, TaskListViewControllerProtocol {
    
    // MARK: - IBOtlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "identifier")
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - VIP connections
    var interactor: TaskListInteractorProtocol?
    var router: TaskListRouterProtocol?
    
    // MARK: - Variables
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
        // Reset searchText in searchBar
        searchBar.text = ""
    }

    func handleOutput(_ output: TaskListPresenterOutput) {
        switch output {
        case .showTaskList(let tasks):
            self.tasks = tasks
            // Reload data in tableView
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        // Navigate to TaskDetail
        router?.navigate(to: .showNewTaskDetail)
    }
    
    @IBAction func sortButtonTapped(_ sender: Any) {
        // Call the sorting function from interactor
        interactor?.didSortTasks()
    }
    
}

// MARK: - Extensions
extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Navigate to the selected cell
        router?.navigate(to: .showEditTaskDetail(index: indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Add 'slide to delete' functionality
            interactor?.didDeleteTask(task: tasks[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Set the number of rows in the tableView
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a cell, configure it and return it
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
        cell.titleLabel.text = tasks[indexPath.row].title
        cell.detailLabel.text = tasks[indexPath.row].detail
        let date = tasks[indexPath.row].completionDate
        cell.completionDate.text = configureDate(date: date!, type: "Date")
        cell.completionTime.text = configureDate(date: date!, type: "Time")
        return cell
    }
    
    // Function to convert Date to String
    func configureDate(date: Date, type: String) -> String {
        let dateFormatter = DateFormatter()
        if type == "Date"{
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }else if type == "Time" {
            dateFormatter.dateFormat = "hh:mm"
            return dateFormatter.string(from: date)
        }
        return "Date and time error"
    }
}

// Function for the searching functionality
extension TaskListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor?.didSearchTask(searchText: searchText)
    }
}
