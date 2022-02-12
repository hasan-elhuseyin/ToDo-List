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
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Variables
    var interactor: TaskDetailInteractorProtocol?
    var router: TaskDetailRouterProtocol?
    var realTask: Task?
    var isUpdating: Bool = false
    
    // ViewDidLoad function
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
    }
    
    // HandleOutput function
    func handleOutput(_ output: TaskDetailPresenterOutput) {
        switch output {
        case .showTask(let task):
            // Initialize the variables
            taskTitle.text = task.title
            taskDetail.text = task.detail
            datePicker.date = task.completionDate
            // Set these values to handle the updating act
            isUpdating = true
            saveButton.isHidden = true
        }
    }
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        // Declare the variables needed for the notification
        let creationDate = Date()
        let completionDate = datePicker.date
        guard let title = taskTitle.text,
              let detail = taskDetail.text
        else {
            print("Error occurred while saving data.")
            return
        }
        
        // Check whether it's for an update or it's for a new added task
        if isUpdating {
            interactor?.didUpdateData(realTask: realTask!, title: title, detail: detail, completionDate: completionDate, creationDate: creationDate)
        }else {
            interactor?.didSaveData(title: title, detail: detail, completionDate: completionDate, creationDate: creationDate)
        }
        router?.navigate(to: .showTaskList)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        router?.navigate(to: .showTaskList)
    }
    
}

// MARK: - Extensions
extension TaskDetailViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isHidden = false
    }
}

extension TaskDetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        saveButton.isHidden = false
    }
}
