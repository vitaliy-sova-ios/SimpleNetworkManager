//
//  AuthUserResponseDTO.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import Foundation

struct AuthUserResponseDTO: Codable {
    let token: String
    let user: AuthUserDTO
}
