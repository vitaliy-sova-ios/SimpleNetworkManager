//
//  AuthRepositoryImpl.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import Foundation

final class AuthRepositoryImpl: AuthRepository {
    
    private let network: AuthNetworkService

    init(network: AuthNetworkService) {
        self.network = network
    }

    func login(email: String, password: String) async throws -> User {
        let dto = try await network.login(email, password)

        return dto.user.toDomain()
    }
    
    func signUp(email: String, password: String) async throws -> User {
        let dto = try await network.signUp(email, password)

        return dto.user.toDomain()
    }
    
    func signUpEnterCode(code: String) async throws -> User {
        let dto = try await network.signUpEnterCode(code: code)

        return dto.user.toDomain()
    }
    
    func forgotPass(email: String) async throws -> User {
        let dto = try await network.forgotPass(email: email)

        return dto.user.toDomain()
    }
    
    func forgotPassEnterCode(code: String) async throws -> User {
        let dto = try await network.forgotPassEnterCode(code: code)

        return dto.user.toDomain()
    }
    
    func logout() async throws -> Bool {
        let dto = try await network.logout()

        return dto
    }
}
