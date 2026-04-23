//
//  Untitled.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import SwiftUI


// MARK: - SETTINGS COORDINATOR

final class SettingsCoordinator: BaseFlowCoordinator<SettingsCoordinator.Route> {
    enum Route: Hashable {
        case profile
        case account
        case subscription
        case colors
    }
}
