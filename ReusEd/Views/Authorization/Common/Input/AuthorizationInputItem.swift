//
//  AuthorizationInputItem.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct AuthorizationInputItem<Content: View>: View {

    @EnvironmentObject var viewConfiguration: AuthorizationViewConfiguration

    private var icon: AuthorizationIcon
    private var content: () -> Content

    init(icon: AuthorizationIcon, @ViewBuilder content: @escaping () -> Content) {
        self.icon = icon
        self.content = content
    }

    var body: some View {
        VStack {
            HStack {
                icon
                content()
                    .font(viewConfiguration.fonts.basic)
            }
            Divider()
        }
    }
}

struct AuthorizationInputItem_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationInputItem(icon: AuthorizationIcon("emailIcon")) {
            TextField("Email Address", text: .constant(""))
        }
    }
}
