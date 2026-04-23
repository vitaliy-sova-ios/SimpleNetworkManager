//
//  Untitled.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import SwiftUI

class BaseFlowCoordinator<Route: Hashable>: ObservableObject {

    @Published var path = NavigationPath()

    var onFinish: (() -> Void)?
    var onCancel: (() -> Void)?

    func push(_ route: Route) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func reset() {
        path = NavigationPath()
    }

    func finish() {
        onFinish?()
    }

    func cancel() {
        onCancel?()
    }
}
