//
//  AuthNetworkService.swift
//  MyTube
//
//  Created by Vitaliy on 01.10.2025.
//

import Foundation
import Alamofire

protocol AuthNetworkServiceProtocol {
    func login(_ email: String, _ pass: String) async throws -> DecodingResult<String>
}

struct AuthNetworkService: AuthNetworkServiceProtocol {
    enum EndpointType: EndpointTypeProtocol {
        case login(LoginRequest)
        case register(LoginRequest)
        case registerEnterCode(String)
        case forgotPassword(String)
        case forgotPassEnterCode(String)
        case logout
        
        var url: URL {
            switch self {
            case .login: return URL(string: "\(Constants.Network.host)/api/v1/auth/login")!
            case .register: return URL(string: "\(Constants.Network.host)/api/v1/auth/register")!
            case .registerEnterCode: return URL(string: "\(Constants.Network.host)/api/v1/auth/register/enter-code")!
            case .forgotPassword: return URL(string: "\(Constants.Network.host)/api/v1/auth/forgot-password")!
            case .forgotPassEnterCode: return URL(string: "\(Constants.Network.host)/api/v1/auth/forgot-password/enter-code")!
            case .logout: return URL(string: "\(Constants.Network.host)/api/v1/auth/logout")!
            }
        }

        var method: HTTPMethod {
            switch self {
            case .login,
                 .register,
                 .registerEnterCode,
                 .forgotPassword,
                 .forgotPassEnterCode,
                 .logout: return .post
            }
        }

        var headers: HTTPHeaders? {
            switch self {
            case .login,
                 .register,
                 .registerEnterCode,
                 .forgotPassword,
                 .forgotPassEnterCode,
                 .logout: return nil
            }
        }
        
        var body: (any Encodable)? {
            switch self {
                
            case let .login(req),
                 let .register(req): return req
                
            case let .registerEnterCode(req),
                 let .forgotPassword(req),
                 let .forgotPassEnterCode(req):
                return req

            case .logout:
                return nil
            }
        }
        
    }

    func login(_ email: String, _ pass: String) async throws -> DecodingResult<String> {
        let request = LoginRequest(email: email, password: pass)
        return try await NetworkManager.shared.request(EndpointType.login(request), resultType: String.self)
    }
}

///MODELS
extension AuthNetworkService {
    struct LoginRequest: Codable {
        let email: String
        let password: String
    }
}


struct AuthNetworkServiceMock: AuthNetworkServiceProtocol {
    func login(_ email: String, _ pass: String) async throws -> DecodingResult<String> {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
//        if email.isEmpty || pass.isEmpty {
//            return .error()
//        }
        
        return .value("Logged in successfully")
    }
}
