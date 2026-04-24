//
//  VideoModel.swift
//  MyTube
//
//  Created by Vitaliy on 24.04.2026.
//

import Foundation

struct VideoItem: Codable {
    let id: String
    let url: URL
    let name: String
}
