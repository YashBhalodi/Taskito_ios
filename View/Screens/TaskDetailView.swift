//
//  TaskDetailView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 25/02/23.
//

import SwiftUI

struct TaskDetailView: View {
    var task: TaskModel
    var body: some View {
        Text("")
            .navigationBarTitle(Text(task.title))
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                TaskDetailView(task: TaskModel(title: "Sample Task", status: TaskStatus.todo))
                    .navigationBarTitleTextColor(.accentColor)
            }
        }
    }
}
