//
//  AddTaskView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 18/02/23.
//

import SwiftUI

struct AddTaskView: View {
    @State var titleInput : String = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 24, content: {
            Text("What do you want to accomplish?")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
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
            Button(action: {}, label: {
                Text("Add")
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10.0)
            })
        })
        .padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
