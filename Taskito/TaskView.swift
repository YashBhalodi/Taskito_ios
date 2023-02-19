//
//  TaskView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 18/02/23.
//

import SwiftUI

class Task : Identifiable, ObservableObject {
    let id: String = UUID().uuidString
    var title: String
    @Published var isCompleted: Bool
    
    init(_ title: String,_ isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func markAsComplete() {
        self.isCompleted = true
    }
    
    func toggleStatus() {
        self.isCompleted.toggle()
    }
}

struct TaskView: View {
    @StateObject var taskObj : Task
    var checkMarkTransition : AnyTransition = AnyTransition.asymmetric(
        insertion: .move(edge: .bottom),
        removal: .opacity.animation(.easeInOut(duration: 0.05))
    )
    var body: some View {
        Button(action: {
            withAnimation {
                taskObj.toggleStatus()
            }
        }, label: {
            HStack {
                if(taskObj.isCompleted) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .animation(.easeInOut(duration: 0.1))
                        .transition(checkMarkTransition)
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.black)
                        .animation(.easeInOut(duration: 0.1))
                        .transition(checkMarkTransition)
                }
                
                Text(taskObj.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(taskObj.isCompleted ? .green : .black)
                    .animation(.easeInOut(duration: 0.1))
                
                Spacer()
            }
            .padding(.vertical)
        })
    }
}


struct TaskView_Preview: PreviewProvider {
    static var previews: some View {
        TaskView(taskObj: Task("hey",true))
            .frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
