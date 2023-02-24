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
    var tasks: [TaskModel] = [] {
        didSet {
            saveTasks()
        }
    }
    
    init(id: String = UUID().uuidString, title: String, tasks: [TaskModel] = []) {
        self.id = id
        self.title = title
        self.tasks = loadTasks(title)
    }
    
    mutating func loadTasks (_ title: String) -> [TaskModel] {
        guard let data = UserDefaults.standard.data(forKey: title) else { return [] }
        guard let savedTasks = try? JSONDecoder().decode([TaskModel].self, from: data) else { return [] }
        return savedTasks
    }
    
    func saveTasks () {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: self.title)
        }
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
    
    mutating func removeTask(indexSet: IndexSet) {
        self.tasks.remove(atOffsets: indexSet)
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
