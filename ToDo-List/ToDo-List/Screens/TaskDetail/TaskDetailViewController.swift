//
//  TaskDetailViewController.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import UIKit

class TaskDetailViewController: UIViewController, TaskDetailViewProtocol {
    
    // MARK: - IBOutlets
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
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        let creationDate = Date()
        let completionDate = datePicker.date
        guard let title = taskTitle.text,
              let detail = taskDetail.text
        else {
            print("Error occurred while saving data.")
            return
        }
        
        interactor?.didSaveData(title: title, detail: detail, completionDate: completionDate, creationDate: creationDate)
        router?.navigate(to: .showTaskList)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        router?.navigate(to: .showTaskList)
    }
    
}
