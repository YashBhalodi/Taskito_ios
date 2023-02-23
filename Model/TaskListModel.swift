//
//  TaskListModel.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import Foundation

var nextStatusDict: [TaskStatus:TaskStatus] = [
    TaskStatus.todo:TaskStatus.inProgress,
    TaskStatus.inProgress:TaskStatus.completed,
]

struct TaskListModel: Identifiable {
    let id: String
    var title: String
    var tasks: [TaskModel]
    
    init(id: String = UUID().uuidString, title: String, tasks: [TaskModel] = []) {
        self.id = id
        self.title = title
        self.tasks = [
            TaskModel(title: "Hey", status: TaskStatus.todo),
            TaskModel(title: "Heyasa s", status: TaskStatus.todo)
        ]
    }
    
    mutating func addTask(_ task: TaskModel) {
        self.tasks.append(task)
    }
    
    mutating func removeTask(_ task: TaskModel) {
        let index = self.tasks.firstIndex(where: {$0.id == task.id})
        if let removeAt = index {
            self.tasks.remove(at: removeAt)
        }
    }
    
    mutating func updateTaskStatus(task: TaskModel, status: TaskStatus) {
        let index = self.tasks.firstIndex(where: {$0.id == task.id})
        if let foundIndex = index {
            self.tasks[foundIndex] = tasks[foundIndex].updateStatus(status: status)
        }
    }
    
    mutating func transitionTaskToNextStatus(task: TaskModel) {
        let index = self.tasks.firstIndex(where: {$0.id == task.id})
        if let foundIndex = index {
            var currentTask = tasks[foundIndex]
            let nextStatus = nextStatusDict[tasks[foundIndex].status]
            if let updatedStatus = nextStatus {
                self.tasks[foundIndex] = currentTask.updateStatus(status: updatedStatus)
            }
        }
    }
}
