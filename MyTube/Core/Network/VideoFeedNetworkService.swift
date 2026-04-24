//
//  VideoFeedNetworkService.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import Foundation
import Alamofire

protocol VideoFeedNetworkServiceProtocol {
    func getVideos(_ page: Int) async throws -> [VideoItem]
}

struct VideoFeedNetworkService: VideoFeedNetworkServiceProtocol {
    enum EndpointType: EndpointTypeProtocol {
        case videos(VideosRequest)
        
        var url: URL {
            switch self {
            case .videos: return URL(string: "\(Constants.Network.host)/api/v1/video")!
            }
        }

        var method: HTTPMethod {
            switch self {
            case .videos: return .get
            }
        }

        var headers: HTTPHeaders? {
            switch self {
            case .videos: return nil
            }
        }
        
        var body: (any Encodable)? {
            switch self {
                
            case let .videos(req): return req
            }
        }
        
    }

    func getVideos(_ page: Int) async throws -> [VideoItem] {
        let request = VideosRequest(page: page)
        return try await NetworkManager.shared.request(EndpointType.videos(request))
    }
}

///MODELS
extension VideoFeedNetworkService {
    struct VideosRequest: Codable {
        let page: Int
    }
}


struct VideoFeedNetworkServiceMock: VideoFeedNetworkServiceProtocol {
    func getVideos(_ page: Int) async throws -> [VideoItem] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
//        if email.isEmpty || pass.isEmpty {
//            return .error()
//        }
        
        return []
    }
}
