//
//  TaskView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

struct StatusChip: View {
    var status: TaskStatus
    
    var body: some View {
        Text(status.rawValue)
            .padding(4.0)
            .padding(.horizontal, 4)
            .font(.caption)
            .foregroundColor(foregroundColorDict[status])
            .background(bgColorDict[status].opacity(0.1))
            .cornerRadius(8.0)
    }
}

struct TaskItemView: View {
    var task: TaskModel
    var hideStatusChip: Bool = true
    
    var body: some View {
        HStack {
            Text(task.title)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .lineLimit(2)
                .foregroundColor(.accentColor)
                .lineSpacing(8)
                .padding(.trailing, 2)
            Spacer()
            
            if !hideStatusChip {
                StatusChip(status: task.status)
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskItemView(task: TaskModel(title: "Task 1basdasdua da sdasidasidasd ad aasdbasiodba sdao da sdaod osd as diusadsa djas  ", status: TaskStatus.todo))
                .previewLayout(.sizeThatFits)
            TaskItemView(task: TaskModel(title: "Task 1basdasdua da sdasidasidasd ad aasdbasiodba sdao da sdaod osd as diusadsa djas  ", status: TaskStatus.inProgress))
                .previewLayout(.sizeThatFits)
            TaskItemView(task: TaskModel(title: "Task 1basdasdua da sdasidasidasd ad aasdbasiodba sdao da sdaod osd as diusadsa djas  ", status: TaskStatus.completed))
                .previewLayout(.sizeThatFits)
            TaskItemView(task: TaskModel(title: "Task 1basdasdua da sdasidasidasd ad aasdbasiodba sdao da sdaod osd as diusadsa djas  ", status: TaskStatus.completed), hideStatusChip: true)
                .previewLayout(.sizeThatFits)
        }
    }
}
