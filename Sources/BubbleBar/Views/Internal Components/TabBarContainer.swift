// Created By Jared Davidson

import SwiftUI

extension BubbleBar {
    internal struct _TabBarContainer<ContainerContent: View>: View {
        @Environment(\.theme) private var theme
        @Environment(\.bubbleBarConfiguration) private var configuration
        let content: ContainerContent
        
        init(@ViewBuilder content: () -> ContainerContent) {
            self.content = content()
        }
        
        var body: some View {
            content
                .padding(.horizontal, 8)
                .padding(.vertical, 6)
                .frame(
                    minWidth: configuration.size?.width,
                    maxWidth: configuration.size == nil ? nil : configuration.size?.width,
                    minHeight: configuration.size?.height,
                    maxHeight: configuration.size?.height
                )
                .background {
                    configuration.shape
                        .fill(theme.colors.cardBackground)
                }
                .clipShape(configuration.shape)
                .padding(configuration.padding)
        }
    }
} 
