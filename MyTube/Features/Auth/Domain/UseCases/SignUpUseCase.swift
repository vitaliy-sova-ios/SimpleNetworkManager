//
//  SignUpUseCase.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import Foundation

final class SignUpUseCase {

    private let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(email: String, password: String) async throws -> User {
        try await repository.signUp(email: email, password: password)
    }
}
