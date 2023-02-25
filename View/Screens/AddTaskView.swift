//
//  AddTask.swift
//  Taskito
//
//  Created by Yash Bhalodi on 22/02/23.
//

import SwiftUI

struct AddTaskView: View {
    @Environment (\.presentationMode) var presentationMode
    var projectVM: ProjectViewModel
    @State var titleInput : String = ""
    
    var body: some View {
        VStack(spacing:20) {
            Text("What do you want to accomplish?")
                .foregroundColor(.accentColor)
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Learn go ...", text: $titleInput)
                .foregroundColor(.accentColor)
                .font(.title3.weight(.semibold))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            Button("Add to \"\(projectVM.project.title)\"", action: {
                projectVM.addTask(TaskModel(title: titleInput, status: TaskStatus.todo))
                presentationMode.wrappedValue.dismiss()
            })
            .frame(maxWidth: .infinity)
            .font(.headline)
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.6628800035, blue: 0.8386012912, alpha: 1))]),
                    startPoint: .bottomTrailing,
                    endPoint: .center
                )
            )
            .foregroundColor(.white)
            .cornerRadius(12)
            
            
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(projectVM: ProjectViewModel())
    }
}
