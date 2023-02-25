//
//  TaskListViewModel.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

class TaskListViewModel: ObservableObject {
    @Published var taskList: TaskListModel = TaskListModel(title: "My work")
    
    func getStatusWiseTask(status: TaskStatus) -> [TaskModel] {
        return self.taskList.tasks.filter { task in
            return task.status == status
        }
    }
    
    func removeTask(indexSet: IndexSet) {
        self.taskList.removeTask(indexSet: indexSet)
    }
    
    func removeTask(_ task: TaskModel) {
        self.taskList.removeTask(task)
    }
    
    func moveTask(_ indices: IndexSet,_ newOffSet: Int) {
        self.taskList.moveTask(indices, newOffSet)
    }
    
    func transitionTaskToNextStatus(_ task: TaskModel) {
        self.taskList.transitionTaskToNextStatus(task: task)
    }
}
