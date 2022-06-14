//
//  AuthorizationHeader.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct AuthorizationHeader: View {

    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    var logoName: String
    var title: String
    var welcomeMessage: String

    var body: some View {
        VStack(spacing: 0) {
            FlexibleSpacer(minHeight: 4.0, maxHeight: 22.0)

            logoImage()

            FlexibleSpacer(minHeight: 4.0, maxHeight: 22.0)

            titleView()

            FlexibleSpacer(minHeight: 4.0, maxHeight: 18.0)

            welcomeMessageView()
        }
    }

    private func logoImage() -> some View {
        Image(logoName)
    }

    private func titleView() -> some View {
        Text(title)
            .font(viewConfiguration.fonts.title)
            .fontWeight(.heavy)
    }

    private func welcomeMessageView() -> some View {
        Text(welcomeMessage)
            .font(viewConfiguration.fonts.basic)
            .foregroundColor(viewConfiguration.colors.subMessage)
            .multilineTextAlignment(.center)
    }
}

struct AuthorizationHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationHeader(
            logoName: "Logo",
            title: "Welcome Back!",
            welcomeMessage: "Log In into your account and get back to your courses and topics."
        )
    }
}
