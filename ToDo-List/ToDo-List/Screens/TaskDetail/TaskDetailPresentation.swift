//
//  TaskDetailPresentation.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import Foundation

struct TaskDetailPresentation {
    // MARK: - Variables
    let title: String
    let detail: String
    let completionDate: Date
    
    // MARK: - Initializers
    init(title: String, detail: String, completionDate: Date) {
        self.title = title
        self.detail = detail
        self.completionDate = completionDate
    }

    init(task: Task) {
        self.init(title: task.title!,
                  detail: task.detail!,
                  completionDate: task.completionDate!)
    }
}
