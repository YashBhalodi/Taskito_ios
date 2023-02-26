
//  TaskListView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

// TODO - Bug
/// 1 - List reordering operation is broken since we are showing and operating on different list

// TODO - Feat
/// 1 - empty state view - overall and status wise
/// 2 - app icon
/// 3 - app splash screen
/// 4 - customize status picker
/// 5 - localisation
/// 6 - Project CRUD
/// 7 - Custom Project workflow
/// 8 - Export Project data
/// 9 - Enhance TaskModel with taskDescription
/// 10 - Task view UI
/// 11 - Form in add task screen

// TODO - Maintainance
/// refactor for terminology taskList to project

struct ProjectView: View {
    @StateObject var vm = ProjectViewModel()
    @State var selectedStatus: TaskStatus = TaskStatus.todo
    @State var selectedTaskId: String?
    
    var body: some View {
        List {
            Section(
                header: Picker(selection: $selectedStatus, label: Text("Status Filter"), content: {
                    ForEach(TaskStatus.allCases, id: \.rawValue) { status in
                        Text("\(status.rawValue) (\(vm.getTasksOfStatus(status: status).count))").tag(status)
                    }
                })
                .textCase(nil)
                .pickerStyle(SegmentedPickerStyle())
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .frame(minWidth: 0, maxWidth: .infinity, alignment:.leading)
                .padding(.vertical,8)
                .padding(.horizontal)
                .background(Color.white)
            ) {
                ForEach(vm.getTasksOfStatus(status: selectedStatus)) { task in
                    NavigationLink(
                        destination: TaskDetailView(task: task),
                        tag: task.id,
                        selection: $selectedTaskId,
                        label: {TaskItemView(task: task)
                            .contextMenu(ContextMenu(menuItems: {
                                if (TaskStatusModel.nextStatusAvailable(selectedStatus)) {
                                    Button(action: {
                                        withAnimation {
                                            vm.transitionTaskToNextStatus(task)
                                        }
                                    }, label: {
                                        if let nextStatus = TaskStatusModel.getNextStatus(selectedStatus) {
                                            Text(nextStatus.rawValue)
                                        } else {
                                            Text("Next status")
                                        }
                                        
                                    })
                                }
                                Button(action: {
                                    withAnimation {
                                        vm.removeTask(task)
                                    }
                                }, label: {
                                    Text("Delete")
                                })
                            })
                            )
                        }
                    )
                }
                .onDelete(perform: vm.removeTask)
                .onMove(perform: vm.moveTask)
            }
        }
        .refreshOnAppear(selection: $selectedTaskId)
        .listStyle(PlainListStyle())
        .navigationTitle(vm.project.title)
        .navigationBarTitleTextColor(Color.accentColor)
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink(
                destination: AddTaskView(projectVM: vm),
                label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                }
            )
        )
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProjectView()
        }
    }
}
