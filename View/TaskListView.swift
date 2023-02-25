//
//  TaskListView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

// TODO - Bug fix
/// 1 - List disappears for a fraction when we trasition a task to next status

// TODO - Feat
/// 1 - empty state view - overall and status wise
/// 2 - app icon
/// 3 - app splash screen
/// 4 - customize status picker



struct TaskListView: View {
    @StateObject var vm = TaskListViewModel()
    @State var selectedStatus: TaskStatus = TaskStatus.todo
    
    var body: some View {
        NavigationView {
            VStack(spacing: nil) {
                Picker(selection: $selectedStatus, label: Text("Status Filter"), content: {
                    ForEach(TaskStatus.allCases, id: \.rawValue) { status in
                        Text("\(status.rawValue) (\(vm.getTasksOfStatus(status: status).count))").tag(status)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                List {
                    ForEach(vm.getTasksOfStatus(status: selectedStatus)) { task in
                        TaskView(task: task)
                            .contextMenu(ContextMenu(menuItems: {
                                
                                if (TaskStatusModel.nextStatusAvailable(selectedStatus)) {
                                    Button(action: {
                                        vm.transitionTaskToNextStatus(task)
                                    }, label: {
                                        Text("Next status")
                                    })
                                }
                                
                                Button(action: {
                                    vm.removeTask(task)
                                }, label: {
                                    Text("Delete")
                                })
                            }))
                    }
                    .onDelete(perform: vm.removeTask)
                    .onMove(perform: vm.moveTask)
                }
                .listStyle(PlainListStyle())
                .navigationTitle(vm.taskList.title)
                .navigationBarTitleTextColor(Color.accentColor)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink(
                                        destination: AddTaskView(listVM: vm),
                                        label: {
                                            Image(systemName: "plus.app.fill")
                                                .resizable()
                                                .frame(width: 24, height: 24, alignment: .center)
                                        }
                    )
                )
            }
        }
        
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
