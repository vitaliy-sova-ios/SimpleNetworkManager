//
//  Codable+Dictionary.swift
//  MyTube
//
//  Created by Vitaliy on 23.06.2025.
//

import Foundation

extension Encodable {
    func toDict() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
    }
}
