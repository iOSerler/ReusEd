//
//  AuthorizationViewTemplate.swift
//  ReUsedTest
//
//  Created by Danila on 07.06.2022.
//

import SwiftUI

struct AuthorizationViewTemplate<Header: View, Inputs: View, Footer: View>: View {

    private var header: () -> Header
    private var inputs: () -> Inputs
    private var footer: () -> Footer

    init(
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder inputs: @escaping () -> Inputs,
        @ViewBuilder footer: @escaping () -> Footer
    ) {
        self.header = header
        self.inputs = inputs
        self.footer = footer
    }

    var body: some View {
        VStack(spacing: 0) {
            header()

            FlexibleSpacer(minHeight: 4.0, maxHeight: 44.0)

            inputs()
                .padding(.bottom, 8.0)
            Spacer()
            footer()
        }
            .padding(.horizontal, 20.0)
    }
}

struct AuthorizationViewTemplate_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationViewTemplate(
            header: { Text("Header") },
            inputs: { Text("Inputs") },
            footer: { Text("Footer") }
        )
    }
}
