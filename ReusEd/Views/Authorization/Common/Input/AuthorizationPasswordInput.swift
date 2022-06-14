//
//  AuthorizationPasswordInput.swift
//  ReUsedTest
//
//  Created by Danila on 08.06.2022.
//

import SwiftUI

struct AuthorizationPasswordInput: View {

    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    var title: String

    @Binding var password: String

    @State private var isShowPassword = false

    var body: some View {
        AuthorizationInputItem(
            icon: AuthorizationIcon(viewConfiguration.assets.passwordInputIcon)
        ) {
            HStack {
                Group {
                    if isShowPassword {
                        TextField(title, text: $password)
                    } else {
                        SecureField(title, text: $password)
                    }
                }

                Button(
                    action: { isShowPassword.toggle() },
                    label: { AuthorizationIcon(viewConfiguration.assets.passwordShowInputIcon) }
                    )
            }
        }
    }
}

struct AuthorizationPasswordInput_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationPasswordWithEnvironment()
    }

    struct AuthorizationPasswordWithEnvironment: View {
        @StateObject var viewConfiguration = AuthorizationViewConfiguration()

        @State var password = ""

        var body: some View {
            AuthorizationPasswordInput(
                title: "Password",
                password: $password
            )
                .environmentObject(viewConfiguration)
                .accentColor(viewConfiguration.colors.accent)
        }
    }
}
