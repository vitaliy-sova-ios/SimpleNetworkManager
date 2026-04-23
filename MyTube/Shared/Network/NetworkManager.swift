//
//  NetworkManager.swift
//  MyTube
//
//  Created by Vitaliy on 23.06.2025.
//

import Foundation
import Alamofire

struct ServerError: Decodable {
    let message: String
    let code: Int
}

enum APIError: Error {
    case alamofire(ServerError)
    case decoding(Error)
    case server(ServerError)
    case unknown
}

protocol EndpointTypeProtocol {
    var url: URL { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var body: Encodable? { get }
}

class NetworkManager {
    private init() {}
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(_ type: EndpointTypeProtocol) async throws -> T {
        
        let parameters: [String: Any] = type.body?.toDict() ?? [:]
        
        let response = await AF.request(
            type.url,
            method: type.method,
            parameters: parameters,
            headers: type.headers
        )
            .serializingData()
            .response
        
        if let data = response.data {
            let decoder = JSONDecoder()
            // success
            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                
                // server error (ONLY if structure is guaranteed)
                if let serverError = try? decoder.decode(ServerError.self, from: data) {
                    throw APIError.server(serverError)
                }
                
                throw APIError.decoding(error)
            }
        } else if let afError = response.error {
            throw APIError.alamofire(
                .init(
                    message: afError.localizedDescription,
                    code: response.response?.statusCode ?? 0
                )
            )
        } else {
            throw APIError.unknown
        }
    }
}
