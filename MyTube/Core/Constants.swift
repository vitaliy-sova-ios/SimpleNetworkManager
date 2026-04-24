//
//  Constants.swift
//  MyTube
//
//  Created by Vitaliy on 01.10.2025.
//

struct Constants {
    struct Network {
#if DEBUG
        static let host: String = "https://api.github.com"
#else
        static let host: String = "https://httpbin.org"
#endif
    }
}
