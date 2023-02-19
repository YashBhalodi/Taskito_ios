//
//  TaskListView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

class TaskList: Identifiable, ObservableObject {
    let id: String = UUID().uuidString
    @Published var tasks: [Task] = []
    
    init() {
        self.tasks = []
    }
    
    func addTask(task: Task) {
        tasks.append(task)
    }
}

struct TaskListView: View {
    @StateObject var taskList: TaskList
    var body: some View {
        List {
            ForEach(taskList.tasks) { item in
                TaskView(taskObj: item)
            }
        }
    }
}
