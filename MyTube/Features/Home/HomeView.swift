//
//  HomeView.swift
//  MyTube
//
//  Created by Vitaliy on 23.04.2026.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: HomeCoordinator
    
    @StateObject private var vm = HomeVM()
    
    var body: some View {
        ZStack {
            Image("111")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
            VStack {
                Text("Presets")
                
                Button("Create Preset") {
                    coordinator.push(.createPreset)
                }
                
                Button("Start Timer") {
                    coordinator.isShowLogin = true
                }
            }
        }
        .onAppear {
            vm.coordinator = self.coordinator
        }
    }
    
}

#Preview {
    HomeView()
}
