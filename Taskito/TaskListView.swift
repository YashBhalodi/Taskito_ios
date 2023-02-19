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
    
    func deleteTask(task: Task) {
        let index = tasks.firstIndex(where: {
            $0.id == task.id
        })
        if let removeAt = index {
            tasks.remove(at: removeAt)
        }
    }
}

struct TaskListView: View {
    @StateObject var taskList: TaskList
    var body: some View {
        List {
            ForEach(taskList.tasks) { item in
                TaskView(taskObj: item)
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            item.markAsComplete()
                        }, label: {
                            Label("Mark as complete", systemImage: "checkmark")
                        })
                        Button(action: {
                            taskList.deleteTask(task: item)
                        }, label: {
                            Label("Delete", systemImage: "trash.fill")
                        })
                    }))
            }
        }
    }
}
