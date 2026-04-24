//
//  AuthRequest.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import Foundation

struct AuthRequestDTO: Codable {
    let email: String
    let password: String
}
