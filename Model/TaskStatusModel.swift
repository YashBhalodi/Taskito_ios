//
//  TaskStatusModel.swift
//  Taskito
//
//  Created by Yash Bhalodi on 25/02/23.
//

import Foundation
import SwiftUI

var nextStatusDict: [TaskStatus:TaskStatus] = [
    TaskStatus.todo:TaskStatus.inProgress,
    TaskStatus.inProgress:TaskStatus.completed,
]

var bgColorDict : [TaskStatus:Color] = [
    TaskStatus.todo : Color.gray,
    TaskStatus.inProgress: Color.purple,
    TaskStatus.completed: Color.green,
]

var foregroundColorDict : [TaskStatus:Color] = [
    TaskStatus.todo : Color.gray,
    TaskStatus.inProgress: Color.purple,
    TaskStatus.completed: Color.green,
]

enum TaskStatus: String, Codable, CaseIterable {
    case todo = "To do"
    case inProgress = "In Progress"
    case completed = "Completed"
}

struct TaskStatusModel {
    static func nextStatusAvailable(_ status: TaskStatus) -> Bool {
        return nextStatusDict[status] != nil
    }
}
