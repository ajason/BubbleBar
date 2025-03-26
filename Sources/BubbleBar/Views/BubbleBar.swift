// Created By Jared Davidson

import SwiftUIX

/// A SwiftUI package that provides a customizable, animated tab bar with a bubble effect.
public enum BubbleBar {}

/// A customizable tab bar view that provides a modern, animated interface for navigation.
/// The tab bar features a bubble effect that moves between selected items and supports both icon and label display.
///
/// Example usage:
/// ```swift
/// BubbleBarView(selectedTab: $selectedTab) {
///     Text("Home View")
///         .tabBarItem {
///             Label("Home", systemImage: "house.fill")
///         }
///     Text("Settings View")
///         .tabBarItem {
///             Label("Settings", systemImage: "gear")
///         }
/// }
/// .bubbleBarStyle(.dark)
/// ```
public struct BubbleBarView<Content: View>: View {
  @Environment(\.bubbleBarConfiguration) private var configuration
  @Namespace private var namespace
  @Binding var selectedTab: Int
  private let content: Content

  /// Creates a new bubble bar view.
  /// - Parameters:
  ///   - selectedTab: A binding to the currently selected tab index
  ///   - content: A view builder that creates the content for each tab
  public init(selectedTab: Binding<Int>, @ViewBuilder content: () -> Content) {
    self._selectedTab = selectedTab
    self.content = content()
  }

  public var body: some View {
    ZStack(alignment: .bottom) {
      _VariadicViewAdapter(content) { content in
        ZStack {
          ForEach(content.children.indices, id: \.self) { index in
            if index == selectedTab {
              content.children[index]
                .transition(configuration.viewTransition)
            }
          }
        }
        .animation(configuration.viewTransitionAnimation, value: selectedTab)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)

      HStack {
        switch configuration.alignment {
        case .leading:
          BubbleBar._TabBarContainer {
            _VariadicViewAdapter(content) { content in
              HStack {
                ForEach(content.children.indices, id: \.self) { index in
                  if let label = content.children[index].traits.tabBarLabel {
                    BubbleBar._TabBarButton(
                      label: label,
                      isSelected: selectedTab == index,
                      index: index,
                      namespace: namespace,
                      showLabel: configuration.showLabels,
                      action: {
                        withAnimation(configuration.animation) {
                          selectedTab = index
                        }
                      }
                    )
                    if index != content.children.indices.last && !configuration.equalItemSizing {
                      Spacer()
                    }
                  }
                }
              }
            }
          }
          Spacer()
        case .center:
          Spacer()
          BubbleBar._TabBarContainer {
            _VariadicViewAdapter(content) { content in
              HStack {
                ForEach(content.children.indices, id: \.self) { index in
                  if let label = content.children[index].traits.tabBarLabel {
                    BubbleBar._TabBarButton(
                      label: label,
                      isSelected: selectedTab == index,
                      index: index,
                      namespace: namespace,
                      showLabel: configuration.showLabels,
                      action: {
                        withAnimation(configuration.animation) {
                          selectedTab = index
                        }
                      }
                    )
                    if index != content.children.indices.last && !configuration.equalItemSizing {
                      Spacer()
                    }
                  }
                }
              }
            }
          }
          Spacer()
        case .trailing:
          Spacer()
          BubbleBar._TabBarContainer {
            _VariadicViewAdapter(content) { content in
              HStack {
                ForEach(content.children.indices, id: \.self) { index in
                  if let label = content.children[index].traits.tabBarLabel {
                    BubbleBar._TabBarButton(
                      label: label,
                      isSelected: selectedTab == index,
                      index: index,
                      namespace: namespace,
                      showLabel: configuration.showLabels,
                      action: {
                        withAnimation(configuration.animation) {
                          selectedTab = index
                        }
                      }
                    )
                    if index != content.children.indices.last && !configuration.equalItemSizing {
                      Spacer()
                    }
                  }
                }
              }
            }
          }
        }
      }
      .animation(configuration.animation, value: selectedTab)
      .environment(\.theme, configuration.style.theme)
      .compositingGroup()
      .shadow(
        color: configuration.shadowColor,
        radius: configuration.shadowRadius,
        x: configuration.shadowOffset.x,
        y: configuration.shadowOffset.y
      )
      .accessibilityElement(children: .contain)
      .accessibilityLabel("Tab Bar")
    }
    .ignoresSafeArea(.keyboard)
  }
}

// MARK: - View Modifiers
extension View {
  /// Applies a custom style to the bubble bar.
  /// - Parameter style: The style to apply
  /// - Returns: A view with the modified bubble bar style
  public func bubbleBarStyle(_ style: BubbleBar.Style) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.style = style
    }
  }

  /// Sets the animation used for tab transitions and bubble movement.
  /// - Parameter animation: The animation to apply
  /// - Returns: A view with the modified bubble bar animation
  public func bubbleBarAnimation(_ animation: Animation) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.animation = animation
    }
  }

  /// Sets the animation used for view transitions between tabs.
  /// - Parameter animation: The animation to apply
  /// - Returns: A view with the modified view transition animation
  public func bubbleBarViewTransitionAnimation(_ animation: Animation) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.viewTransitionAnimation = animation
    }
  }

  /// Sets the transition effect used for view transitions between tabs.
  /// - Parameter transition: The transition to apply
  /// - Returns: A view with the modified view transition
  public func bubbleBarViewTransition(_ transition: AnyTransition) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.viewTransition = transition
    }
  }

  /// Controls whether labels are shown for selected tabs.
  /// - Parameter show: Whether to show labels
  /// - Returns: A view with the modified label visibility
  public func showBubbleBarLabels(_ show: Bool) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.showLabels = show
    }
  }

  /// Sets the size of the bubble bar.
  /// - Parameter size: The desired size of the bubble bar
  /// - Returns: A view with the modified bubble bar size
  public func bubbleBarSize(_ size: CGSize) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.size = size
    }
  }

  /// Sets the shape of the bubble bar container.
  /// - Parameter shape: The shape to apply to the container
  /// - Returns: A view with the modified bubble bar container shape
  public func bubbleBarShape<S: Shape>(_ shape: S) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.shape = AnyShape(shape)
    }
  }

  /// Sets the shape of the bubble bar items.
  /// - Parameter shape: The shape to apply to the selected item background
  /// - Returns: A view with the modified bubble bar item shape
  public func bubbleBarItemShape<S: Shape>(_ shape: S) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.itemShape = AnyShape(shape)
    }
  }

  /// Sets the padding around the bubble bar.
  /// - Parameter padding: The padding to apply
  /// - Returns: A view with the modified bubble bar padding
  public func bubbleBarPadding(_ padding: EdgeInsets) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.padding = padding
    }
  }

  /// Configures the shadow for the bubble bar.
  /// - Parameters:
  ///   - radius: The blur radius of the shadow
  ///   - color: The color of the shadow
  ///   - offset: The offset of the shadow
  /// - Returns: A view with the modified bubble bar shadow
  public func bubbleBarShadow(
    radius: CGFloat = 1,
    color: Color = .black.opacity(0.2),
    offset: CGPoint = .zero
  ) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.shadowRadius = radius
      config.shadowColor = color
      config.shadowOffset = offset
    }
  }

  /// Makes all bubble bar items equal in size.
  /// - Parameter enabled: Whether to enable equal sizing for all items
  /// - Returns: A view with the modified bubble bar item sizing
  public func bubbleBarItemEqualSizing(_ enabled: Bool) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.equalItemSizing = enabled
    }
  }

  /// Sets the alignment of the bubble bar.
  /// - Parameter alignment: The alignment to apply to the bubble bar
  /// - Returns: A view with the modified bubble bar alignment
  public func bubbleBarAlignment(_ alignment: BubbleBar.TabBarAlignment) -> some View {
    transformEnvironment(\.bubbleBarConfiguration) { config in
      config.alignment = alignment
    }
  }

  /// Wraps the view in a bubble bar with the specified selected tab.
  /// - Parameter selectedTab: A binding to the currently selected tab index
  /// - Returns: A view wrapped in a bubble bar
  public func bubbleBar(selectedTab: Binding<Int>) -> some View {
    BubbleBarView(selectedTab: selectedTab) {
      self
    }
  }
}
