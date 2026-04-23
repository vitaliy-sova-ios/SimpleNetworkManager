//
//  Untitled.swift
//  MyTube
//
//  Created by Vitaliy on 22.04.2026.
//

import SwiftUI

final class AuthCoordinator: BaseFlowCoordinator<AuthCoordinator.Route> {
    enum Route: Hashable {
        case signIn
        case signUp
        case resetPassword
    }
}
