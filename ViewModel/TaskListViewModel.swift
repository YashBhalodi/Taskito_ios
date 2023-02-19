//
//  TaskListViewModel.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

class TaskListViewModel: ObservableObject {
    @Published var taskList: TaskListModel = TaskListModel(title: "My work")
}
