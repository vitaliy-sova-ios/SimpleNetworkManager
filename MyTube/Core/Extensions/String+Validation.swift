//
//  String+Validation.swift
//  MyTube
//
//  Created by Vitaliy on 26.04.2026.
//

extension String {
    func isEmailValid(_ email: String) -> Bool {
        // Простая валидация email
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }
    
    
}
