# BubbleBar

A modern, customizable SwiftUI tab bar with a bubble effect animation. BubbleBar provides a sleek and intuitive navigation experience for iOS and macOS applications.

## Features

- 🎨 Multiple built-in themes (Dark, Desert, Forest, Night Owl, High Contrast, Ocean)
- ✨ Smooth bubble animation between tabs
- 🎯 Customizable container and item shapes
- 📐 Flexible sizing options (fixed or edge-to-edge)
- 🔤 Optional label display for selected tabs
- 🎭 Customizable shadows and effects
- 🎬 Independent animations for tab bar and view transitions
- ♿️ Full accessibility support
- 📱 iOS 16+ and macOS 14+ support

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/BubbleBar.git", from: "1.0.0")
]
```

## Usage

### Basic Implementation

```swift
import SwiftUI
import BubbleBar

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        BubbleBarView(selectedTab: $selectedTab) {
            Text("Home View")
                .tabBarItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            Text("Settings View")
                .tabBarItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .bubbleBarStyle(.dark)
    }
}
```

### Customization

BubbleBar offers extensive customization options:

```swift
BubbleBarView(selectedTab: $selectedTab) {
    // Your tab content here
}
.bubbleBarStyle(.ocean)                    // Choose a theme
.bubbleBarAnimation(.spring())             // Custom animation for bubble movement
.bubbleBarViewTransition(.easeInOut)       // Custom animation for view transitions
.showBubbleBarLabels(true)                 // Show/hide labels
.bubbleBarSize(CGSize(width: 350, height: 60))  // Optional fixed size
.bubbleBarShape(RoundedRectangle(cornerRadius: 20))  // Container shape
.bubbleBarItemShape(Capsule())             // Selected item shape
.bubbleBarItemEqualSizing(true)            // Equal width items
.bubbleBarPadding(.init(top: 8, leading: 16, bottom: 8, trailing: 16))  // Custom padding
.bubbleBarShadow(radius: 4, color: .black.opacity(0.1), offset: .init(x: 0, y: 2))  // Custom shadow
```

### Available Themes

- `.dark` - Dark mode optimized with blue accents
- `.desert` - Warm orange and beige tones
- `.forest` - Natural green theme
- `.nightOwl` - Dark blue theme for night use
- `.highContrast` - Accessibility optimized theme
- `.ocean` - Cool blue tones

### Animation Control

BubbleBar provides two separate animation modifiers:
1. `bubbleBarAnimation(_:)` - Controls the animation of the bubble movement and tab bar changes
2. `bubbleBarViewTransition(_:)` - Controls the animation of view transitions between tabs

This separation allows for fine-tuned control over different aspects of the animation.

### Sizing Behavior

BubbleBar supports two sizing modes:
1. Edge-to-edge (default) - The bar stretches to fill the available width
2. Fixed size - Set a specific size using `bubbleBarSize()`

### Item Sizing Options

Control how items are sized within the bar:
1. Dynamic (default) - Selected items expand to show labels
2. Equal sizing - All items maintain equal width using `bubbleBarItemEqualSizing(true)`

## Accessibility

BubbleBar includes some accessibility support (Could be better I think)
I just need to deep dive into accessibility to really know.

## Requirements

- iOS 16.0+ / macOS 14.0+
- Swift 6.0+
- Xcode 15.0+

## License

This project is licensed under the MIT License - see the LICENSE file for details. 
