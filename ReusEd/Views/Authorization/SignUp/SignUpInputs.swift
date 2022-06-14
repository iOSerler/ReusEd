//
//  SignUpInputs.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct SignUpInputs: View {

    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    @Binding var name: String
    @Binding var email: String
    @Binding var password: String

    @State private var confirmPassword: String = ""

    var body: some View {
        VStack(spacing: 16.0) {
            AuthorizationNameInput(name: $name)
            AuthorizationEmailInput(email: $email)
            AuthorizationPasswordInput(
                title: viewConfiguration.texts.passwordInputTitle,
                password: $password
            )
            AuthorizationPasswordInput(
                title: viewConfiguration.texts.confirmPasswordInputTitle,
                password: $confirmPassword
            )
        }
    }
}

struct SignUpInputs_Previews: PreviewProvider {
    static var previews: some View {
        SignUpInputsWithEnvironment()
    }

    struct SignUpInputsWithEnvironment: View {
        @StateObject var viewConfiguration = AuthorizationViewConfiguration()

        var body: some View {
            SignUpInputs(
                name: .constant(""),
                email: .constant(""),
                password: .constant("")
            )
                .environmentObject(viewConfiguration)
                .accentColor(viewConfiguration.colors.accent)
        }
    }
}
