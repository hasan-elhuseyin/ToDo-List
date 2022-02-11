//
//  TaskDetailViewController.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import UIKit

class TaskDetailViewController: UIViewController, TaskDetailViewProtocol {
    
    // MARK: - IBActions
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var taskDetail: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Variables
    var interactor: TaskDetailInteractorProtocol?
    var router: TaskDetailRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
    }

    func handleOutput(_ output: TaskDetailPresenterOutput) {
        switch output {
        case .showTask(let task):
            taskTitle.text = task.title
            taskDetail.text = task.detail
            datePicker.date = task.completionDate
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let creationDate = Date()
        let completionDate = datePicker.date
        guard let title = taskTitle.text,
              let detail = taskTitle.text
        else {
            print("Error occurred while saving data.")
            return
        }
        
        CoreDataManager.shared.saveData(title: title, detail: detail, creationDate: creationDate, completionDate: completionDate)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        router?.navigate(to: .showTaskList)
    }
    
}
