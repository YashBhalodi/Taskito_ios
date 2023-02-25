//
//  TaskModel.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import Foundation

enum TaskStatus: String, Codable, CaseIterable {
    case todo = "To do"
    case inProgress = "In Progress"
    case completed = "Completed"
    
    func isNextStatusAvailable(_ status: TaskStatus) {
        
    }
}

struct TaskStatusModel {
    static func nextStatusAvailable(_ status: TaskStatus) -> Bool {
        if nextStatusDict[status] != nil {
            return true
        }
        return false
    }
}

struct TaskModel: Identifiable, Codable {
    var id: String
    var title: String
    var status: TaskStatus = TaskStatus.todo
    
    
    init(id: String = UUID().uuidString, title: String, status: TaskStatus) {
        self.id = id
        self.title = title
        self.status = status
    }
    
    mutating func markAsComplete() -> TaskModel {
        self = TaskModel(id: self.id, title: self.title, status: TaskStatus.completed)
        return self
    }
    
    mutating func updateStatus(status: TaskStatus) -> TaskModel {
        self = TaskModel(id: self.id, title: self.title, status: status)
        return self
    }
}
