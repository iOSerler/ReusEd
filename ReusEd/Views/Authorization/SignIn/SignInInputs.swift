//
//  SignInInputs.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct SignInInputs: View {
    
    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    @Binding var email: String
    @Binding var password: String

    var onForgotPassword: (() -> Void)?

    var body: some View {
        VStack(spacing: 16.0) {
            AuthorizationEmailInput(email: $email)
            AuthorizationPasswordInput(
                title: viewConfiguration.texts.passwordInputTitle,
                password: $password
            )
            forgotPassword()
        }
    }

    private func forgotPassword() -> some View {
        HStack {
            Spacer()
            Button(viewConfiguration.texts.forgotPassword) {
                onForgotPassword?()
            }
            .font(viewConfiguration.fonts.basic)
        }
    }
}

struct SignInInputs_Previews: PreviewProvider {
    static var previews: some View {
        SignInInputsWithEnvironment()
    }

    struct SignInInputsWithEnvironment: View {
        @StateObject var viewConfiguration = AuthorizationViewConfiguration()

        var body: some View {
            SignInInputs(
                email: .constant(""),
                password: .constant("")
            )
                .environmentObject(viewConfiguration)
                .accentColor(viewConfiguration.colors.accent)
        }
    }
}
