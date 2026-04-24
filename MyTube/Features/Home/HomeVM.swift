//
//  HomeVM.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import Foundation
import Resolver

@MainActor
class HomeVM: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    @Published var isSuccess: Bool = false
    @Published var isValid: Bool = false
    
    var coordinator: HomeCoordinator?
    
    init(_ coordinator: HomeCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
