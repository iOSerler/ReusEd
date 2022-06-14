//
//  SignUpView.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct SignUpView: View {

    @EnvironmentObject var viewModel: AuthorizationViewModel
    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        AuthorizationViewTemplate(
            header: {
                AuthorizationHeader(
                    logoName: viewConfiguration.assets.logo,
                    title: viewConfiguration.texts.signUpTitle,
                    welcomeMessage: viewConfiguration.texts.signUpWelcome
                )
            },
            inputs: {
                SignUpInputs(
                    name: $name,
                    email: $email,
                    password: $password
                )
            },
            footer: {
                AuthorizationFooter(
                    applyButtonText: viewConfiguration.texts.signUp,
                    onApply: { viewModel.signUp(name: name, email: email, password: password) },
                    changeAuthorizationMessage: viewConfiguration.texts.signInProposal,
                    anotherAuthorization: viewConfiguration.texts.signIn,
                    onChangeAuthorization: {
                        withAnimation {
                            viewModel.currentType = .signIn
                        }
                    },
                    policies: AuthorizationPolicies(
                        policyAcceptText: viewConfiguration.texts.policyAccept,
                        policies: viewConfiguration.policies
                    )
                )
            }
        )
    }
}

struct SingUpView_Previews: PreviewProvider {
    static var previews: some View {
        SingUpViewWithEnvironment()
    }

    struct SingUpViewWithEnvironment: View {
        @StateObject var viewModel = AuthorizationViewModel()
        @StateObject var viewConfiguration = AuthorizationViewConfiguration()

        var body: some View {
            SignUpView()
                .environmentObject(viewModel)
                .environmentObject(viewConfiguration)
                .accentColor(viewConfiguration.colors.accent)
        }
    }
}
