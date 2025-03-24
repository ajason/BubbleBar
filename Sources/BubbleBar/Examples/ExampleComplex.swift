// Created By Jared Davidson

import SwiftUI

internal struct ExampleComplex: View {
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
        .bubbleBarAnimation(.bouncy)
        .bubbleBarStyle(.desert)
        .showBubbleBarLabels(true)
        .bubbleBarSize(CGSize(width: 350, height: 54)) // Default Height 54
        .bubbleBarShape(RoundedRectangle(cornerRadius: 15))
        .bubbleBarItemShape(RoundedRectangle(cornerRadius: 11))
        .bubbleBarItemEqualSizing(true)
        .bubbleBarPadding(.zero)
    }
}

#Preview {
    ExampleComplex()
}
