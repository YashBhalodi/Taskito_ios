//
//  AddTask.swift
//  Taskito
//
//  Created by Yash Bhalodi on 22/02/23.
//

import SwiftUI

struct AddTaskView: View {
    @Environment (\.presentationMode) var presentationMode
    var listVM: TaskListViewModel
    @State var titleInput : String = ""
    
    var body: some View {
        VStack {
            TextField("What do you want to accomplish?", text: $titleInput)
            Button(action: {
                listVM.taskList.addTask(TaskModel(title: titleInput, status: TaskStatus.todo))
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Add to \"\(listVM.taskList.title)\"")
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.accentColor)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            })
        }
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(listVM: TaskListViewModel())
    }
}
