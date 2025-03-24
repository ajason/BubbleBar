// Created By Jared Davidson

import SwiftUIX

struct TabBarLabelKey: _ViewTraitKey, Sendable {
    @inlinable
    static var defaultValue: AnyView? {
        nil
    }
}

extension _ViewTraitKeys {
    var tabBarLabel: TabBarLabelKey.Type {
        TabBarLabelKey.self
    }
}

extension View {
    public func tabBarItem<V: View>(@ViewBuilder _ label: @escaping () -> V) -> some View {
        _trait(\.tabBarLabel, AnyView(label()))
    }
} 
