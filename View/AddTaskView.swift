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
        VStack(spacing:20) {
            Text("What do you want to accomplish?")
                .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Learn go ...", text: $titleInput)
                .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                .font(.title2.weight(.semibold))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 12)
            
            Button("Add to \"\(listVM.taskList.title)\"", action: {
                listVM.taskList.addTask(TaskModel(title: titleInput, status: TaskStatus.todo))
                presentationMode.wrappedValue.dismiss()
            })
            .font(.headline)
            .padding()
            .background(LinearGradient(
                            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.6628800035, blue: 0.8386012912, alpha: 1))]),
                            startPoint: .bottomTrailing,
                            endPoint: .center
            ))
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(listVM: TaskListViewModel())
    }
}
