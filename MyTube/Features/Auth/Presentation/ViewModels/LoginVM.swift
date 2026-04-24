//
//  LoginVM.swift
//  MyTube
//
//  Created by Vitaliy on 01.10.2025.
//

import Foundation
import Resolver

@MainActor
class LoginVM: ObservableObject {
    private let useCase: LoginUseCase
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    @Published var isSuccess: Bool = false
    @Published var isValid: Bool = false
    
    var coordinator: AuthCoordinator?
    
    init(loginUseCase: LoginUseCase, _ coordinator: AuthCoordinator) {
        self.useCase = loginUseCase
        self.coordinator = coordinator
    }
    
    func login() {
        Task {
            isLoading = true
            do {
                let token = try await useCase.execute(email: email, password: password)
                //TODO: Save token
                isLoading = false
                isSuccess = true
                
                coordinator?.onFinish?()
                
            } catch(let error) {
                isLoading = false
                self.error = error.localizedDescription
            }
        }
    }
}
