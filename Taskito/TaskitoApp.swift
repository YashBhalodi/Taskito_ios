//
//  TaskitoApp.swift
//  Taskito
//
//  Created by Yash Bhalodi on 04/02/23.
//

import SwiftUI

@main
struct TaskitoApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.blue.ignoresSafeArea()
                HomeScreen()
            }
        }
    }
}
