// Created By Jared Davidson

import SwiftUI

internal struct ExampleGreen: View {
    @State private var selectedTab = 0
    @Environment(\.theme) var theme
    
    var body: some View {
        BubbleBarView(selectedTab: $selectedTab) {
            Color.blue
                .edgesIgnoringSafeArea(.all)
                .tabBarItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Color.red
                .edgesIgnoringSafeArea(.all)
                .tabBarItem {
                    Label("Focus", systemImage: "timer")
                }
            Color.purple
                .edgesIgnoringSafeArea(.all)
                .tabBarItem {
                    Label("Something", systemImage: "mail.stack")
                }
            
            Color.green
                .edgesIgnoringSafeArea(.all)
                .tabBarItem {
                    Label("Eraser", systemImage: "eraser")
                }
            
            
            Color.black
                .edgesIgnoringSafeArea(.all)
                .tabBarItem {
                    Label("Grid", systemImage: "grid")
                }
        }
        .bubbleBarStyle(.ocean)
        .bubbleBarViewTransitionAnimation(.bouncy)
        .bubbleBarViewTransition(.slide)
    }
}

#Preview {
    ExampleGreen()
}
