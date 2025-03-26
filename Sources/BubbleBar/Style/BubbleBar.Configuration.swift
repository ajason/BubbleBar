// Created By Jared Davidson

import SwiftUI

extension BubbleBar {
  public enum TabBarAlignment {
    case leading
    case center
    case trailing
  }

  @MainActor
  public final class Configuration: ObservableObject, Sendable {
    public var style: Style
    public var animation: Animation
    public var viewTransitionAnimation: Animation
    public var viewTransition: AnyTransition
    public var showLabels: Bool
    public var size: CGSize?
    public var shape: AnyShape
    public var itemShape: AnyShape
    public var padding: EdgeInsets
    public var equalItemSizing: Bool
    public var shadowRadius: CGFloat
    public var shadowColor: Color
    public var shadowOffset: CGPoint
    public var alignment: TabBarAlignment

    public init(
      style: Style = .forest,
      animation: Animation = .spring(response: 0.3, dampingFraction: 0.7),
      viewTransitionAnimation: Animation = .smooth,
      viewTransition: AnyTransition = .opacity,
      showLabels: Bool = true,
      size: CGSize? = nil,
      shape: AnyShape = AnyShape(Capsule()),
      itemShape: AnyShape = AnyShape(Capsule()),
      padding: EdgeInsets = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16),
      equalItemSizing: Bool = false,
      shadowRadius: CGFloat = 1,
      shadowColor: Color = .black.opacity(0.2),
      shadowOffset: CGPoint = .zero,
      alignment: TabBarAlignment = .center
    ) {
      self.style = style
      self.animation = animation
      self.viewTransitionAnimation = viewTransitionAnimation
      self.viewTransition = viewTransition
      self.showLabels = showLabels
      self.size = size
      self.shape = shape
      self.itemShape = itemShape
      self.padding = padding
      self.equalItemSizing = equalItemSizing
      self.shadowRadius = shadowRadius
      self.shadowColor = shadowColor
      self.shadowOffset = shadowOffset
      self.alignment = alignment
    }
  }
}

// MARK: - Environment Key
struct BubbleBarConfigurationKey: @preconcurrency EnvironmentKey {
  @MainActor
  static let defaultValue = BubbleBar.Configuration()
}

extension EnvironmentValues {
  var bubbleBarConfiguration: BubbleBar.Configuration {
    get { self[BubbleBarConfigurationKey.self] }
    set { self[BubbleBarConfigurationKey.self] = newValue }
  }
}
