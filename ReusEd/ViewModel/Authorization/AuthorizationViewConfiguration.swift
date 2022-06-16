//
//  AuthorizationViewConfiguration.swift
//  ReusEd
//
//  Created by Danila on 13.06.2022.
//

import SwiftUI

class AuthorizationViewConfiguration: ObservableObject {

    struct Texts {

        var signIn = "Sign In"
        var signInTitle = "Welcome Back!"
        var signInWelcome = "Log In into your account and get back to your courses and topics."
        var signInProposal = "Already have an account?"

        var signUp = "Sign Up"
        var signUpTitle = "Get Started"
        var signUpWelcome = "Create your account and enjoy easy and intuitive learning with ReusEd."
        var signUpProposal = "Don’t have an account yet?"

        var nameInputTitle = "Full Name"
        var emailInputTitle = "Email Address"
        var passwordInputTitle = "Password"
        var confirmPasswordInputTitle = "Confirm Password"

        var forgotPassword = "Forgot Password?"

        var policyAccept = "By continuing, you agree to our"
    }

    struct Assets {

        var logo = "bookLogo"

        var nameInputIcon = "user"
        var emailInputIcon = "envelope"
        var passwordInputIcon = "lock"
        var passwordShowInputIcon = "eye-crossed"
    }

    struct Colors {

        var subMessage = Color("Grey2")
        var accent = Color("Primary")
    }

    struct Fonts {

        var title: Font = .custom("Rubik", size: 24.0)
        var basic: Font = .custom("Rubik", size: 14.0)
        var sub: Font = .custom("Rubik", size: 12.0)
    }

    struct ApplicationPolicy {

        let name: String
        let url: URL
    }

    @Published var texts = Texts()
    @Published var assets = Assets()
    @Published var colors = Colors()
    @Published var fonts = Fonts()

    @Published var policies = [
        ApplicationPolicy(
            name: "Terms of Service",
            url: URL(string: "https://www.google.ru")!
        ),
        ApplicationPolicy(
            name: "Privacy Policy",
            url: URL(string: "https://www.google.ru")!
        ),
        ApplicationPolicy(
            name: "Content Policy",
            url: URL(string: "https://www.google.ru")!
        )
    ]
}
