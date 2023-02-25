//
//  RefreshOnAppearModifier.swift
//  Taskito
//
//  Created by Yash Bhalodi on 25/02/23.
//

import Foundation
import SwiftUI

struct RefreshOnAppearModifier<Tag: Hashable>: ViewModifier {
    /// https://stackoverflow.com/a/65788555
    @State private var viewId = UUID()
    @Binding var selection: Tag?
    
    func body(content: Content) -> some View {
        content
            .id(viewId)
            .onAppear {
                if selection != nil {
                    viewId = UUID()
                    selection = nil
                }
            }
    }
}

extension View {
    func refreshOnAppear<Tag: Hashable>(selection: Binding<Tag?>? = nil) -> some View {
        modifier(RefreshOnAppearModifier(selection: selection ?? .constant(nil)))
    }
}
