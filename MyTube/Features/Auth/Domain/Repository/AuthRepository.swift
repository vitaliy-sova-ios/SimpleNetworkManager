//
//  AuthRepository.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import Foundation

protocol AuthRepository {
    func login(email: String, password: String) async throws -> User
    func signUp(email: String, password: String) async throws -> User
    func signUpEnterCode(code: String) async throws -> User
    func forgotPass(email: String) async throws -> User
    func forgotPassEnterCode(code: String) async throws -> User
    func logout() async throws -> Bool
}
