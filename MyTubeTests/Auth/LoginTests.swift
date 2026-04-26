//
//  LoginTests.swift
//  MyTube
//
//  Created by Vitaliy on 26.04.2026.
//

import XCTest
@testable import MyTube

final class LoginTests: XCTestCase {
    @MainActor func testLogin() async {
        // Arrange
        let coordinator = AuthCoordinator()
        var wasCalled = false
        coordinator.onFinish = { wasCalled = true }
        
        let repository = AuthRepositoryMock()
        let useCase = LoginUseCase(repository: repository)

        let vm = LoginVM(loginUseCase: useCase, coordinator)
        vm.email = "test@test.com"
        vm.password = "123456"
        await vm.login()
        // Act & Assert
        // Replace with real assertions once ViewModel exposes observable state or outputs.
        // For now, just assert that dependencies are wired and objects are created.
        XCTAssertTrue(wasCalled)
    }
}
