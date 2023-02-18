//
//  ContentView.swift
//  Taskito
//
//  Created by Yash Bhalodi on 04/02/23.
//

import SwiftUI

struct Task: Identifiable {
    var id = UUID();
    var title = "";
    var isCompleted = false;
    
    init(title: String) {
        self.title = title
    }
}

struct TaskItem: View {
    @State var task: Task
    var body: some View {
        HStack {
            Text(task.title).strikethrough(task.isCompleted)
        }
    }
}

struct ContentView: View {
    @State var task = Task(title: "Heaay")
    
    var body: some View {
        NavigationView {
            List() {
                TaskItem(task: task)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Button tapped!")
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Taskito").font(.title3).fontWeight(.bold)
                }
            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
