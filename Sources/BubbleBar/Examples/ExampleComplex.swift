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
        .bubbleBarViewTransition(.opacity)
        .bubbleBarStyle(.desert)
        .showBubbleBarLabels(true)
        .bubbleBarSize(CGSize(width: 150, height: 54)) // Default Height 54
        .bubbleBarShape(RoundedRectangle(cornerRadius: 15))
        .bubbleBarItemShape(RoundedRectangle(cornerRadius: 11))
        .bubbleBarItemEqualSizing(true)
        .bubbleBarPadding(.init(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 0.0))
        .bubbleBarAlignment(.leading)
    }
}

#Preview {
    ExampleComplex()
}
