//
//  AddTaskView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 18/02/23.
//

import SwiftUI

struct AddTaskView: View {
    var taskList: TaskList
    @State var titleInput : String = ""
    @State var showAlert : Bool = false
    @Environment (\.presentationMode) var presentationMode;
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24, content: {
                Text("What do you want to accomplish?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .opacity(0.7)
                    .padding(.horizontal, 10)
                VStack {
                    TextField("", text: $titleInput)
                        .placeholder(when: titleInput.count == 0, placeholder: {
                            Text("Learn go ... ")
                                .opacity(0.3)
                        })
                        .foregroundColor(.blue)
                        .font(.title2.bold())
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .cornerRadius(6)
                    
                    Divider().overlay(Color.blue)
                }
                Button(action: {
                    if(titleInput.count > 3) {
                        taskList.addTask(task: Task(titleInput, false))
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showAlert.toggle()
                    }
                    
                }, label: {
                    Text("Add to work")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .padding()
                        .frame(maxWidth:.infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                })
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Minimum 3 characters are required"))
            })
            .padding()
        }
    }
}
