//
//  HomeScreen.swift
//  Taskito
//
//  Created by Yash Bhalodi on 18/02/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ProjectView()
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
