//
//  TaskListView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

struct TaskListView: View {
    @StateObject var vm = TaskListViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.taskList.tasks, content: {
                    TaskView(task: $0)
                })
            }
            .listStyle(PlainListStyle())
            .navigationTitle(vm.taskList.title)
            .navigationBarItems(trailing: Button(action: {
                vm.taskList.addTask(TaskModel(title: "New", status: TaskStatus.todo))
            }, label: {
                Text("Add")
            }))
        }
        
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
