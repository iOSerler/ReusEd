//
//  AuthorizationNameInput.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct AuthorizationNameInput: View {

    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    @Binding var name: String

    var body: some View {
        AuthorizationInputItem(
            icon: AuthorizationIcon(viewConfiguration.assets.nameInputIcon)
        ) {
            TextField(viewConfiguration.texts.nameInputTitle, text: $name)
        }
    }
}

struct AuthorizationNameInput_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationNameInput(name: .constant(""))
    }
}
