//
//  AuthorizationFooter.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct AuthorizationPolicies {
    let policyAcceptText: String
    let policies: [AuthorizationViewConfiguration.ApplicationPolicy]
}

struct AuthorizationFooter: View {

    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    var applyButtonText: String
    var onApply: (() -> Void)?

    var changeAuthorizationMessage: String
    var anotherAuthorization: String
    var onChangeAuthorization: (() -> Void)?

    var policies: AuthorizationPolicies?

    var body: some View {
        VStack {
            if let polices = policies {
                policiesView(polices)
            }

            AuthorizationMainButton(applyButtonText) { onApply?() }
                .padding(.vertical, 4.0)

            changeAuthorizationView()
                .padding(.bottom, 8.0)
        }
    }

    private func policiesView(_ policies: AuthorizationPolicies) -> some View {
        VStack(spacing: 8.0) {
            Text(policies.policyAcceptText)
                .foregroundColor(viewConfiguration.colors.subMessage)
            HStack(spacing: 0.0) {
                if let firstPolicy = policies.policies.first {
                    policyView(firstPolicy)
                    ForEach(policies.policies[1...], id: \.self.name) { policy in
                        Text(" · ")
                        policyView(policy)
                    }
                }
            }
        }
        .font(viewConfiguration.fonts.sub)
    }

    private func policyView(_ policy: AuthorizationViewConfiguration.ApplicationPolicy) -> some View {
        Link(policy.name, destination: policy.url)
    }

    private func changeAuthorizationView() -> some View {
        HStack(spacing: 0) {
            Text(changeAuthorizationMessage + " ")
            Button(anotherAuthorization) { onChangeAuthorization?() }
        }
        .font(viewConfiguration.fonts.basic)
    }
}

struct AuthorizationFooter_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationFooter(
            applyButtonText: "Sign In",
            onApply: { print("Enter me!") },
            changeAuthorizationMessage: "Don’t have an account yet?",
            anotherAuthorization: "Sign Up",
            onChangeAuthorization: { print("I want to Sing Up!") },
            policies: AuthorizationPolicies(
                policyAcceptText: "By continuing, you agree to our",
                policies: [
                    AuthorizationViewConfiguration.ApplicationPolicy(
                        name: "Terms of Service",
                        url: URL(fileURLWithPath: "https://www.google.ru")
                    ),
                    AuthorizationViewConfiguration.ApplicationPolicy(
                        name: "Privacy Policy",
                        url: URL(fileURLWithPath: "https://www.google.ru")
                    ),
                    AuthorizationViewConfiguration.ApplicationPolicy(
                        name: "Content Policy",
                        url: URL(fileURLWithPath: "https://www.google.ru")
                    )
                ]
            )
        )
    }
}
