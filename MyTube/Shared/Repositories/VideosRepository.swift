//
//  VideosRepository.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import Foundation

struct VideoItem: Codable {
    let id: String
    let url: URL
    let name: String
}

protocol VideoFeedRepositoryProtocol {
    func fetchPage(_ page: Int) async throws -> [VideoItem]
}

final class VideoFeedRepository: VideoFeedRepositoryProtocol {

    private let api: VideoFeedNetworkServiceProtocol
    private let cache: VideoFeedCacheProtocol

    init(api: VideoFeedNetworkServiceProtocol,
         cache: VideoFeedCacheProtocol) {
        self.api = api
        self.cache = cache
    }

    func fetchPage(_ page: Int) async throws -> [VideoItem] {

        if let cached = cache.getVideos(page: page) {
            return cached
        }

        let result = try await api.getVideos(page)
        cache.save(result, page: page)
        return result
    }
}
