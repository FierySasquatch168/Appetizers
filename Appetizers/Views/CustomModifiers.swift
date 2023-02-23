//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Aleksandr Eliseev on 22.02.2023.
//

import SwiftUI

struct StandartButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandartButtonStyle())
    }
}
