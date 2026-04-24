//
//  AppDI.swift
//  MyTube
//
//  Created by Vitaliy on 01.10.2025.
//

import Resolver

extension Resolver: @retroactive ResolverRegistering {

    public static func registerAllServices() {
        Resolver.register {
            AuthRepositoryImpl(network: AuthNetworkService()) as AuthRepository
        }
    }
}

