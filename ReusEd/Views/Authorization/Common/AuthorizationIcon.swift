//
//  AuthorizationIcon.swift
//  ReUsedTest
//
//  Created by Danila on 08.06.2022.
//

import SwiftUI

struct AuthorizationIcon: View {

    private var icon: Image
    private var iconWidth: CGFloat

    init(_ name: String, width: CGFloat = 20.0) {
        self.icon = Image(name)
        self.iconWidth = width
    }

    var body: some View {
        icon
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: iconWidth, height: iconWidth)
    }
}

struct AuthorizationIcon_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationIcon("passwordIcon")
    }
}
