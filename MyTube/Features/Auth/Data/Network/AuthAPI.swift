//
//  AuthAPI.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import Foundation
import Alamofire

enum AuthAPI: EndpointTypeProtocol {
    case login(AuthRequestDTO)
    case register(AuthRequestDTO)
    case registerEnterCode(AuthCodeRequestDTO)
    case forgotPassword(AuthForgotDTO)
    case forgotPassEnterCode(AuthCodeRequestDTO)
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
        .post
    }

    var headers: HTTPHeaders? {
        nil
    }
    
    var body: (any Encodable)? {
        switch self {
            
        case let .login(req),
             let .register(req): return req
            
        case let .registerEnterCode(req),
             let .forgotPassEnterCode(req):
            return req
            
        case let .forgotPassword(req): return req

        case .logout:
            return nil
        }
    }
    
}
