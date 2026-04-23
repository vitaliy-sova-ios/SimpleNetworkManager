//
//  Untitled.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import SwiftUI

// MARK: - HOME COORDINATOR

final class HomeCoordinator: BaseFlowCoordinator<HomeCoordinator.Route> {
    @Published var isShowLogin: Bool = false
    
    enum Route: Hashable {
        case createPreset
        case timer(String)
        case editPreset(String)
    }
}
