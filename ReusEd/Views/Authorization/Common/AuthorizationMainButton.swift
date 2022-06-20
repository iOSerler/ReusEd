//
//  AuthorizationMainButton.swift
//  ReUsedTest
//
//  Created by Danila on 08.06.2022.
//

import SwiftUI

struct AuthorizationMainButton: View {

    private var title: String
    private var onAction: () -> Void

    init(_ title: String, action: @escaping () -> Void ) {
        self.title = title
        self.onAction = action
    }

    var body: some View {
        Button(title) { onAction() }
            .foregroundColor(.white)
            .buttonStyle(ColorButton(color: Color.accentColor))
    }
}

struct AuthorizationMainButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationMainButton("Test") {}
    }
}
