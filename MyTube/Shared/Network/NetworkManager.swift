//
//  NetworkManager.swift
//  MyTube
//
//  Created by Vitaliy on 23.06.2025.
//

import Foundation
import Alamofire

protocol EndpointTypeProtocol {
    var url: URL { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var body: Encodable? { get }
}

struct InternalError: Codable {
    let code: Int
    let message: String
}

enum DecodingResult<T: Decodable>: Decodable {
    case value(T)
    case error(InternalError)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        // Пытаемся декодировать как T
        if let value = try? container.decode(T.self) {
            self = .value(value)
            return
        }

        // Пытаемся декодировать как InternalError
        if let error = try? container.decode(InternalError.self) {
            self = .error(error)
            return
        }

        // Ни один вариант не подошел — бросаем ошибку
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Data did not match any expected type")
    }
}

class NetworkManager {
    private init() {}
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(_ type: EndpointTypeProtocol, resultType: T.Type) async throws -> DecodingResult<T> {
        
        let parameters: [String: Any] = type.body?.toDict() ?? [:]
        
        return try await AF.request(
            type.url,
            method: type.method,
            parameters: parameters,
            headers: type.headers
        )
        .validate()
        .serializingDecodable(DecodingResult<T>.self)
        .value
    }
    
    func post<T: Codable>(_ url: URL, body: T) async throws -> T {
        guard let parameters = body.toDict() else {
            throw NSError(domain: "EncodingError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Не удалось преобразовать body в словарь"])
        }
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        continuation.resume(returning: value)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
