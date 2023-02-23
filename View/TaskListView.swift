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
                ForEach(vm.taskList.tasks) { task in
                    TaskView(task: task)
                        .contextMenu(ContextMenu(menuItems: {
                            Button(action: {
                                vm.taskList.transitionTaskToNextStatus(task: task)
                            }, label: {
                                Text("Next status")
                            })
                            Button(action: {
                            vm.taskList.removeTask(task)
                            }, label: {
                                Text("Delete")
                            })
                        }))
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(vm.taskList.title)
            .navigationBarItems(trailing: NavigationLink(
                                    destination: AddTaskView(listVM: vm),
                                    label: {
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
