//
//  ColorButton.swift
//  ReusEd
//
//  Created by Danila on 14.06.2022.
//

import SwiftUI

struct ColorButton: ButtonStyle {
    var color: Color

    func makeBody(configuration: Configuration) -> some View {
        ColorButton(configuration: configuration, color: color)
    }

    private struct ColorButton: View {
        @Environment(\.isEnabled) var isEnabled

        var configuration: Configuration
        var color: Color

        var body: some View {
            HStack {
                Spacer()
                configuration.label
                Spacer()
            }
            .padding()
            .background(!isEnabled ? Color.gray : color)
            .grayscale(configuration.isPressed ? 0.5 : 0)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .multilineTextAlignment(.center)
        }
    }
}
