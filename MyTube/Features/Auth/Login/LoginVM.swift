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
    @Injected var authService: AuthNetworkServiceProtocol
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    @Published var isSuccess: Bool = false
    @Published var isValid: Bool = false
    
    init() {}
    
    func login() {
        Task {
            isLoading = true
            do {
                let token = try await authService.login(email, password)
                //TODO: Save token
                isLoading = false
                isSuccess = true
            } catch(let error) {
                isLoading = false
                self.error = error.localizedDescription
            }
        }
    }
}
