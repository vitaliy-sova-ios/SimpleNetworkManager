//
//  ContentView.swift
//  MyTube
//
//  Created by Vitaliy on 16.06.2025.
//

import SwiftUI

struct SwipeNavigator: View {
    let items: [String] = ["Экран 1", "Экран 2", "Экран 3", "Экран 4"]

    @State private var currentIndex: Int = 0
    @State private var dragOffset: CGFloat = 0
    @State private var isDraggingUp = false

    var body: some View {
        ZStack {
            if let current = items[safe: currentIndex] {
                SwipeScreen(text: current)
                    .offset(y: dragOffset)
                    .zIndex(1)
            }

            if isDraggingUp,
               let next = items[safe: currentIndex + 1] {
                SwipeScreen(text: next)
                    .offset(y: UIScreen.main.bounds.height + dragOffset)
                    .zIndex(0)
            }

            if !isDraggingUp,
               let prev = items[safe: currentIndex - 1] {
                SwipeScreen(text: prev)
                    .offset(y: -UIScreen.main.bounds.height + dragOffset)
                    .zIndex(0)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragOffset = value.translation.height
                    isDraggingUp = dragOffset < 0
                }
                .onEnded { value in
                    let threshold: CGFloat = 150

                    if dragOffset < -threshold, currentIndex < items.count - 1 {
                        withAnimation(.easeOut(duration: 0.25)) {
                            dragOffset = -UIScreen.main.bounds.height // уезжает вверх
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            currentIndex += 1
                            dragOffset = 0
                        }

                    } else if dragOffset > threshold, currentIndex > 0 {
                        withAnimation(.easeOut(duration: 0.25)) {
                            dragOffset = UIScreen.main.bounds.height // уезжает вниз
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            currentIndex -= 1
                            dragOffset = 0
                        }

                    } else {
                        withAnimation(.spring()) {
                            dragOffset = 0 // откат назад
                        }
                    }
                }
        )
//        .animation(.linear, value: dragOffset)
//        .animation(.linear, value: currentIndex)
        .ignoresSafeArea()
    }
}

struct SwipeScreen: View {
    let text: String
    
    var index: Int {
        (Int(String(text.last ?? "1")) ?? 1) - 1
    }
    
    let colors: [Color] = [.red, .green, .blue, .yellow]

    var body: some View {
        ZStack {
            colors[index]
            Text(text)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

#Preview {
    SwipeNavigator()
}
