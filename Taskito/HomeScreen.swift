//
//  HomeScreen.swift
//  Taskito
//
//  Created by Yash Bhalodi on 18/02/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var taskList: TaskList = TaskList()
    
    var body: some View {
        NavigationView {
            TaskListView(taskList: taskList)
                .listStyle(PlainListStyle())
                .navigationTitle("My work")
                .navigationBarItems(
                    trailing: NavigationLink(
                        destination: AddTaskView(taskList: taskList),
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    )
                )
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
