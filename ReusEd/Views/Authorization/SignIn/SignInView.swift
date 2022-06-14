//
//  SignInView.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var viewModel: AuthorizationViewModel
    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    @State private var email: String = ""
    @State private var password: String = ""

    // TODO: Remove
    @Environment(\.openURL) var openURL

    var body: some View {
        AuthorizationViewTemplate(
            header: {
                AuthorizationHeader(
                    logoName: viewConfiguration.assets.logo,
                    title: viewConfiguration.texts.signInTitle,
                    welcomeMessage: viewConfiguration.texts.signInWelcome
                )
            },
            inputs: {
                SignInInputs(
                    email: $email,
                    password: $password,
                    // TODO: What I should do?
                    onForgotPassword: {
                        openURL(URL(string: "https://style.rbc.ru/life/5be446719a79476f72af759c")!)
                    }
                )
            },
            footer: {
                AuthorizationFooter(
                    applyButtonText: viewConfiguration.texts.signIn,
                    onApply: { viewModel.signIn(email: email, password: password) },
                    changeAuthorizationMessage: viewConfiguration.texts.signUpProposal,
                    anotherAuthorization: viewConfiguration.texts.signUp,
                    onChangeAuthorization: {
                        withAnimation {
                            viewModel.currentType = .signUp
                        }
                    }
                )
            }
        )
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInViewWithEnvironment()
    }

    struct SingInViewWithEnvironment: View {
        @StateObject var viewModel = AuthorizationViewModel()
        @StateObject var viewConfiguration = AuthorizationViewConfiguration()

        var body: some View {
            SignInView()
                .environmentObject(viewModel)
                .environmentObject(viewConfiguration)
                .accentColor(viewConfiguration.colors.accent)
        }
    }
}
