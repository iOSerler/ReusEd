//
//  AuthorizationEmailInput.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct AuthorizationEmailInput: View {

    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    @Binding var email: String

    var body: some View {
        AuthorizationInputItem(
            icon: AuthorizationIcon(viewConfiguration.assets.emailInputIcon)
        ) {
            TextField(viewConfiguration.texts.emailInputTitle, text: $email)
        }
    }
}

struct AuthorizationEmailInput_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationEmailInput(email: .constant(""))
    }
}
