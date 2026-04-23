//
//  Untitled.swift
//  MyTube
//
//  Created by Vitaliy on 22.04.2026.
//

import SwiftUI

// MARK: - ROOT VIEW

struct AppCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        switch coordinator.flow {
        case .splash:
            ProgressView()
                .task {
                    coordinator.start()
                }
            
        case .auth:
            AuthFlowView()
                .environmentObject(coordinator)
                .environmentObject(coordinator.authCoordinator)
            
        case .main:
            MainTabView()
                .environmentObject(coordinator)
                .environmentObject(coordinator.homeCoordinator)
                .environmentObject(coordinator.settingsCoordinator)
        }
    }
}
