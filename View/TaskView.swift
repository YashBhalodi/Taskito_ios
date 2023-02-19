//
//  TaskView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 19/02/23.
//

import SwiftUI

struct TaskView: View {
    var task: TaskModel
    
    var body: some View {
        HStack {
            Text(task.title)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .lineLimit(2)
            Spacer()
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(task: TaskModel(title: "Task 1basdasdua da sdasidasidasd ad aasdbasiodba sdao da sdaod osd as diusadsa djas  ", status: TaskStatus.todo))
            .previewLayout(.sizeThatFits)
    }
}
