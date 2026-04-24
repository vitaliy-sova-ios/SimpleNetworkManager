//
//  AuthFlowFactory.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import SwiftUI
import Resolver

final class AuthFactory {

    @MainActor
    func makeLoginView(_ coordinator: AuthCoordinator) -> some View {
        
        let repository: AuthRepository = Resolver.main.resolve()
        let useCase = LoginUseCase(repository: repository)
        let vm = LoginVM(loginUseCase: useCase, coordinator)
        
        return LoginView(vm: vm)
    }

    @MainActor
    func makeSignUpView(_ coordinator: AuthCoordinator) -> some View {
        
        let repository: AuthRepository = Resolver.main.resolve()
        let useCase = LoginUseCase(repository: repository)
        let vm = LoginVM(loginUseCase: useCase, coordinator)
        
        return LoginView(vm: vm)
    }

    @MainActor
    func makeForgotPasswordView(_ coordinator: AuthCoordinator) -> some View {
        
        let repository: AuthRepository = Resolver.main.resolve()
        let useCase = LoginUseCase(repository: repository)
        let vm = LoginVM(loginUseCase: useCase, coordinator)
        
        return LoginView(vm: vm)
    }
}
