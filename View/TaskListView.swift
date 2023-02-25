//
//  TaskListView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

struct StatusTabPicker: View {
    @Binding var selectedStatus: TaskStatus {
        didSet {
            print(oldValue, selectedStatus)
        }
    }
    var vm: TaskListViewModel
    
    var body: some View {
        Picker(selection: $selectedStatus, label: Text("Status Filter"), content: {
            ForEach(TaskStatus.allCases, id: \.rawValue) { status in
                    Text("\(status.rawValue) (\(getCount(status: status)))").tag(status)
            }
        })
        .pickerStyle(SegmentedPickerStyle())
    }
    
    func getCount(status: TaskStatus) -> Int {
        return self.vm.getTasksOfStatus(status: status).count
    }
}

// TODO - Bug fix
/// 1 - List disappears for a fraction when we trasition a task to next status
/// 2 - List edit mode move and delete action

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
                StatusTabPicker(selectedStatus: $selectedStatus, vm: vm)
                    .padding(.horizontal)
                
                List {
                    ForEach(vm.getTasksOfStatus(status: selectedStatus)) { task in
                        TaskView(task: task)
                            .contextMenu(ContextMenu(menuItems: {
                                Button(action: {
                                    vm.transitionTaskToNextStatus(task)
                                }, label: {
                                    Text("Next status")
                                })
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
