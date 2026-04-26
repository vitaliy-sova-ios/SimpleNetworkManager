//
//  TextFieldStyles.swift
//  MyTube
//
//  Created by Vitaliy on 26.04.2026.
//

import SwiftUI

struct AppTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .modifier(TitleTextModifier())
            .padding(14)
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct TitleTextModifier: ViewModifier {

    func body(content: Content) -> some View {

        content

            .font(DSTypography.title)

            .foregroundColor(DSColor.textPrimary)

    }

}
