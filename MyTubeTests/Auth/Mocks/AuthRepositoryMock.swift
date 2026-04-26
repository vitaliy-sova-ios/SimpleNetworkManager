//
//  AuthRepositoryMock.swift
//  MyTube
//
//  Created by Vitaliy on 26.04.2026.
//

@testable import MyTube

final class AuthRepositoryMock: AuthRepository {

    func login(email: String, password: String) async throws -> User {
        return User(id: "", email: "")
    }
    
    func signUp(email: String, password: String) async throws -> User {
        return User(id: "", email: "")
    }
    
    func signUpEnterCode(code: String) async throws -> User {
        return User(id: "", email: "")
    }
    
    func forgotPass(email: String) async throws -> User {
        return User(id: "", email: "")
    }
    
    func forgotPassEnterCode(code: String) async throws -> User {
        return User(id: "", email: "")
    }
    
    func logout() async throws -> Bool {
        return true
    }
}
