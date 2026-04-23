//
//  LoginView.swift
//  MyTube
//
//  Created by Vitaliy on 01.10.2025.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var coordinator: AuthCoordinator
    
    @StateObject private var vm = LoginVM()
    @FocusState private var focusedField: Field?
    
    enum Field {
        case email
        case password
    }
    
    private var isFormValid: Bool {
        isEmailValid(vm.email) && vm.password.count >= 6
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Вход")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 24)
                
                VStack(spacing: 14) {
                    TextField("Email", text: $vm.email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .focused($focusedField, equals: .email)
                        .submitLabel(.next)
                        .onSubmit { focusedField = .password }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                    
                    SecureField("Пароль", text: $vm.password)
                        .textContentType(.password)
                        .focused($focusedField, equals: .password)
                        .submitLabel(.go)
                        .onSubmit { loginAction() }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                if let error = vm.error, !error.isEmpty {
                    Text(error)
                        .font(.footnote)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                Button(action: loginAction) {
                    Text(vm.isLoading ? "Входим..." : "Войти")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background((isFormValid && !vm.isLoading) ? Color.blue : Color.gray)
                        .cornerRadius(12)
                }
                .disabled(!isFormValid || vm.isLoading)
                .padding(.horizontal)
                
                Spacer()
            }
            
            if vm.isLoading {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.2)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: vm.email) { _, _ in
            vm.error = nil
            vm.isValid = isFormValid
        }
        .onChange(of: vm.password) { _, _ in
            vm.error = nil
            vm.isValid = isFormValid
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Готово") { focusedField = nil }
            }
        }
        .onAppear {
            vm.coordinator = coordinator
        }
    }
    
    private func loginAction() {
        guard isFormValid, !vm.isLoading else { return }
        focusedField = nil
        vm.login()
    }
    
    private func isEmailValid(_ email: String) -> Bool {
        // Простая валидация email
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }
}

//#Preview {
//    LoginView()
//}

