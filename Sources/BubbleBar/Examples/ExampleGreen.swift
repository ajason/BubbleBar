// Created By Jared Davidson

import SwiftUI

internal struct ExampleGreen: View {
    @State private var selectedTab = 0
    
    var body: some View {
        BubbleBarView(selectedTab: $selectedTab) {
            Text("Home View")
                .tabBarItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Focus View")
                .tabBarItem {
                    Label("Focus", systemImage: "timer")
                }
            
            Text("Spatial View")
                .tabBarItem {
                    Label("Spatial", systemImage: "square.grid.2x2")
                }
        }
        .bubbleBarStyle(.forest)
        .bubbleBarItemEqualSizing(false)
    }
}

#Preview {
    ExampleGreen()
}
