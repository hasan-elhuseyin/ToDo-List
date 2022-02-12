//
//  NotificationManager.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 12.02.2022.
//

import Foundation
import UserNotifications

// MARK: - Protocols
protocol LocalNotificationManagerProtocol {
    var notificationList : [Notification] { get set }
    func createNotification()
}

// MARK: - Notification Structure
struct Notification {
    var id : String
    var title : String
    var detail : String
    var CompletionDate: DateComponents
}

// MARK: - LocalNotificationManager class
class LocalNotificationManager: LocalNotificationManagerProtocol {
    
    // MARK: - Variables
    var notificationList = [Notification]()
    
    // MARK: - Functions
    // Create notification
    func createNotification(){
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.configureNotification()
            default :
                self.requestAuthorization()
            }
        }
    }
    
    // Configure notification
    private func configureNotification() {
        
        for notification in notificationList {
            
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.sound = .default
            content.body = notification.detail
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.CompletionDate, repeats: false)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else{
                    print("error while creating the notification")
                    return
                }
            }
        }
    }
    
    // Request authorization for notifications
    private func requestAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { granted, error in
            if granted { self.configureNotification() }
        }
    }
    
}
