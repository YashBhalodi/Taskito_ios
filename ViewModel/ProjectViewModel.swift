//
//  TaskListViewModel.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

class ProjectViewModel: ObservableObject {
    @Published var project: ProjectModel = ProjectModel(title: "My work")
    
    func getTasksOfStatus(status: TaskStatus) -> [TaskModel] {
        return self.project.tasks.filter { task in
            return task.status == status
        }
    }
    
    func removeTask(indexSet: IndexSet) {
        self.project.removeTask(indexSet: indexSet)
    }
    
    func removeTask(_ task: TaskModel) {
        self.project.removeTask(task)
    }
    
    func moveTask(_ indices: IndexSet,_ newOffSet: Int) {
        self.project.moveTask(indices, newOffSet)
    }
    
    func transitionTaskToNextStatus(_ task: TaskModel) {
        self.project.transitionTaskToNextStatus(task: task)
    }
    
    func addTask(_ task: TaskModel) {
        self.project.addTask(task)
    }
}
