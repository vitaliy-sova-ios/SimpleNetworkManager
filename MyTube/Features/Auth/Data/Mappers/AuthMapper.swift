//
//  AuthMapper.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import Foundation

extension AuthUserDTO {
    func toDomain() -> User {
        User(id: self.id, email: self.email)
    }
}
