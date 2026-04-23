//
//  Untitled.swift
//  MyTube
//
//  Created by Vitaliy on 22.04.2026.
//

import SwiftUI

// MARK: - ROOT APP STATE

enum AppFlow {
    case splash
    case auth
    case main
}

// MARK: - APP COORDINATOR

final class AppCoordinator: ObservableObject {
    @Published var flow: AppFlow = .splash

    let authCoordinator = AuthCoordinator()
    let homeCoordinator = HomeCoordinator()
    let settingsCoordinator = SettingsCoordinator()

    func start() {
        flow = .main 
    }

    func didLogin() {
        flow = .main
        authCoordinator.reset()
    }

    func logout() {
        flow = .auth
        homeCoordinator.reset()
        settingsCoordinator.reset()
        
        authCoordinator.onFinish = didLogin
    }
}
