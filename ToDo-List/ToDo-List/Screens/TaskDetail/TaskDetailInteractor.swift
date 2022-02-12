//
//  TaskDetailInteractor.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

class TaskDetailInteractor: TaskDetailInteractorProtocol, TaskDetailDataStoreProtocol {
    
    // MARK: - VIP connections
    var presenter: TaskDetailPresenterProtocol?
    var coreDataManager = CoreDataManager.shared
    var notificationManager: LocalNotificationManagerProtocol?
    
    // MARK: - Variables
    var task: Task?
    
    // MARK: - Functions
    func viewDidLoad() {
        guard let task = task else { return }
        self.presenter?.handeOutput(.showTask(task))
    }
    
    // Save the data to CoreData model
    func didSaveData(title: String, detail: String, completionDate: Date, creationDate: Date) {
        coreDataManager.saveTask(title: title, detail: detail, creationDate: creationDate, completionDate: completionDate)
        
        // Create a notification for the task, using notificatonManaager
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day, .hour, .minute], from: completionDate)
        let notification = Notification(id: UUID().uuidString, title: title, detail: detail, CompletionDate: dateComponent)
        notificationManager?.notificationList.append(notification)
        notificationManager?.createNotification()
        
    }
    
    // Update the data in CoreData model
    func didUpdateData(realTask: Task, title: String, detail: String, completionDate: Date, creationDate: Date) {
        coreDataManager.updateData(task: realTask, title: title, detail: detail, date: completionDate)
    }
    
    
}
