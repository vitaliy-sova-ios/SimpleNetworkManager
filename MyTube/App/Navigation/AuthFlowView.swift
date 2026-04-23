//
//  Untitled 2.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import SwiftUI

// MARK: - AUTH FLOW

struct AuthFlowView: View {
    @EnvironmentObject var app: AppCoordinator
    @EnvironmentObject var coordinator: AuthCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            LoginView()
            .navigationDestination(for: AuthCoordinator.Route.self) { route in
                switch route {
                case .signIn:
                    Text("Sign Up")
                case .signUp:
                    Text("Sign Up")
                case .resetPassword:
                    Text("Reset Password")
                }
            }
        }
    }
}
