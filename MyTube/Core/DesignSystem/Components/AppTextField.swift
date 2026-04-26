//
//  AppTextField.swift
//  MyTube
//
//  Created by Vitaliy on 26.04.2026.
//

import SwiftUI

struct AppTextField: View {
    let title: String
    @Binding var text: String
    let error: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            TextField(title, text: $text)
                .textFieldStyle(AppTextFieldStyle())

            if let error {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}
