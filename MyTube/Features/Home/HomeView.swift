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
            SwipeNavigator()
        }
        .onAppear {
            vm.coordinator = self.coordinator
        }
    }
    
}

#Preview {
    HomeView()
}
