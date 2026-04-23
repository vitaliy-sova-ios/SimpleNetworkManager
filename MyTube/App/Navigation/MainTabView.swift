//
//  Untitled.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import SwiftUI

// MARK: - MAIN TABBAR

struct MainTabView: View {
    @StateObject private var state = TabState()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $state.selected) {
                HomeFlowView(tabState: state)
                    .toolbar(.hidden, for: .tabBar)
                    .tag(0)
                
                SettingsFlowView()
                    .toolbar(.hidden, for: .tabBar)
                    .tag(1)
            }
            
            
            ModernTabBar(state: state)
        }
    }
}

final class TabState: ObservableObject {
    @Published var selected: Int = 0
    @Published var isHidden: Bool = false
}

struct ModernTabBar: View {
    @ObservedObject var state: TabState
    @Namespace private var animation

    var body: some View {
        HStack(spacing: 0) {
            tab(0, "house")
            Spacer()
            tab(1, "person")
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 14)
        .background {
            ZStack {
                // 🌫 glass layer
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .fill(.ultraThinMaterial)

                // 🌤 subtle tint overlay (Apple-style depth)
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .fill(Color.white.opacity(0.06))

                // ✨ inner border highlight
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))

        // 🌫 Apple-style shadow stack
        .shadow(color: .black.opacity(0.18), radius: 20, y: 12)
        .shadow(color: .black.opacity(0.08), radius: 2, y: 1)

        .padding(.horizontal, 18)
        .padding(.bottom, 10)

        // smooth hide
        .offset(y: state.isHidden ? 140 : 0)
        .opacity(state.isHidden ? 0 : 1)
        .scaleEffect(state.isHidden ? 0.96 : 1)
        .animation(.spring(response: 0.28, dampingFraction: 0.86), value: state.isHidden)
    }

    @ViewBuilder
    private func tab(_ index: Int, _ icon: String) -> some View {
        Button {
            withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                state.selected = index
            }
        } label: {
            ZStack {
                if state.selected == index {
                    Circle()
                        .fill(.white.opacity(0.14))
                        .frame(width: 42, height: 42)
                        .matchedGeometryEffect(id: "tab", in: animation)
                        .blur(radius: 0.2)
                }

                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(
                        state.selected == index
                        ? .primary
                        : Color.secondary.opacity(0.7)
                    )
            }
            .frame(width: 44, height: 44)
        }
    }
}

#Preview {
    MainTabView()
}
