//
//  ColorExtension.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 20.06.2022.
//

import Foundation
import SwiftUI

extension Color {
    init?(_ hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var rrr: CGFloat = 0.0
        var ggg: CGFloat = 0.0
        var bbb: CGFloat = 0.0
        var aaa: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        if length == 6 {
            rrr = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            ggg = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            bbb = CGFloat(rgb & 0x0000FF) / 255.0

        } else if length == 8 {
            rrr = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            ggg = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            bbb = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            aaa = CGFloat(rgb & 0x000000FF) / 255.0

        } else {
            return nil
        }

        self.init(red: rrr, green: ggg, blue: bbb, opacity: aaa)
    }
}
