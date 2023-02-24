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
                .onDelete(perform: { indexSet in
                    vm.taskList.removeTask(indexSet: indexSet)
                })
            }
            .listStyle(PlainListStyle())
            .navigationTitle(vm.taskList.title)
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink(
                                    destination: AddTaskView(listVM: vm),
                                    label: {
                                        Image(systemName: "plus.app.fill")
                                            .resizable()
                                            .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                )
            )
        }
        
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
