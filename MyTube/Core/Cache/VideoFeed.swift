//
//  VideoFeedCache.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import Foundation

protocol VideoFeedCacheProtocol {
    func getVideos(page: Int) -> [VideoItem]?
    func save(_ videos: [VideoItem], page: Int)
}

final class VideoFeedMemoryCache: VideoFeedCacheProtocol {

    private var storage: [Int: [VideoItem]] = [:]

    func getVideos(page: Int) -> [VideoItem]? {
        storage[page]
    }

    func save(_ videos: [VideoItem], page: Int) {
        storage[page] = videos
    }
}
