//
//  AuthNetworkService.swift
//  MyTube
//
//  Created by Vitaliy on 01.10.2025.
//

import Foundation
import Alamofire

struct AuthNetworkService {
    
    func login(_ email: String, _ pass: String) async throws -> AuthUserResponseDTO {
        let request = AuthRequestDTO(email: email, password: pass)
        return try await NetworkManager.shared.request(AuthAPI.login(request))
    }
    
    func signUp(_ email: String, _ password: String) async throws -> AuthUserResponseDTO {
        let request = AuthRequestDTO(email: email, password: password)
        return try await NetworkManager.shared.request(AuthAPI.register(request))
    }
    
    func signUpEnterCode(code: String) async throws -> AuthUserResponseDTO {
        let request = AuthCodeRequestDTO(code: code)
        return try await NetworkManager.shared.request(AuthAPI.registerEnterCode(request))
    }
    
    func forgotPass(email: String) async throws -> AuthUserResponseDTO {
        let request = AuthForgotDTO(email: email)
        return try await NetworkManager.shared.request(AuthAPI.forgotPassword(request))
    }
    
    func forgotPassEnterCode(code: String) async throws -> AuthUserResponseDTO {
        let request = AuthCodeRequestDTO(code: code)
        return try await NetworkManager.shared.request(AuthAPI.forgotPassEnterCode(request))
    }
    
    func logout() async throws -> Bool {
        return try await NetworkManager.shared.request(AuthAPI.logout)
    }
}
