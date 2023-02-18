//
//  HomeScreen.swift
//  Taskito
//
//  Created by Yash Bhalodi on 18/02/23.
//

import SwiftUI

struct HomeScreen: View {
    var tasks: [Task] = [
        Task("first", false),
        Task("second", false),
        Task("third", true),
        Task("first", false),
        Task("second", false),
        Task("third", true),
        Task("first", false),
        Task("second", false),
        Task("third", true),
        Task("first", false),
        Task("second", false),
        Task("third", true)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(tasks) { item in
                        TaskView(taskObj: item)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("My work")
                .navigationBarItems(trailing: NavigationLink(
                                        destination: AddTaskView(),
                                        label: {
                                            Image(systemName: "plus.circle.fill").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                        }))
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
