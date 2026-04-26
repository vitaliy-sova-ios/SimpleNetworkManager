//
//  ButtonStyles.swift
//  MyTube
//
//  Created by Vitaliy on 26.04.2026.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(
                background(configuration)
            )
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
    
    private func background(_ configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(isEnabled ? DSColor.primary : DSColor.primary.opacity(0.4))
    }
}

#Preview {
    Button("Primary Button") {
        // Preview action
    }
    .buttonStyle(PrimaryButtonStyle())
    .disabled(false)
}
