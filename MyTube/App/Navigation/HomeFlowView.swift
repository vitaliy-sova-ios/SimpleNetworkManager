//
//  Untitled 2.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import SwiftUI

// MARK: - HOME FLOW

struct HomeFlowView: View {
    @EnvironmentObject var app: AppCoordinator
    @EnvironmentObject var coordinator: HomeCoordinator
    
    @ObservedObject var tabState: TabState

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView()
            .navigationDestination(for: HomeCoordinator.Route.self) { route in
                switch route {
                case .createPreset:
                    Text("Create Preset")

                case .timer(let name):
                    Text("Timer: \(name)")

                case .editPreset(let name):
                    Text("Edit: \(name)")
                }
            }
        }
        .fullScreenCover(isPresented: $coordinator.isShowLogin, content: {
            app.authCoordinator.onFinish = {
                coordinator.isShowLogin = false
            }
            return AuthFlowView()
                .environmentObject(app.authCoordinator)
        })
        .onChange(of: coordinator.path.count) { oldValue, newValue in
            withAnimation(.spring(response: 0.3, dampingFraction: 0.85)) {
                tabState.isHidden = newValue > 0
            }
        }
    }
}
