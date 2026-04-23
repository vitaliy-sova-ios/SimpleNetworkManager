//
//  Untitled.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import SwiftUI

// MARK: - SETTINGS FLOW

struct SettingsFlowView: View {
    @EnvironmentObject var coordinator: SettingsCoordinator
    @EnvironmentObject var app: AppCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack(spacing: 20) {
                Button("Profile") {
                    coordinator.push(.profile)
                }

                Button("Subscription") {
                    coordinator.push(.subscription)
                }

                Button("Logout") {
                    app.logout()
                }
            }
            .navigationDestination(for: SettingsCoordinator.Route.self) { route in
                switch route {
                case .profile:
                    Text("Profile")

                case .account:
                    Text("Account")

                case .subscription:
                    Text("Subscription")

                case .colors:
                    Text("Colors")
                }
            }
        }
    }
}
