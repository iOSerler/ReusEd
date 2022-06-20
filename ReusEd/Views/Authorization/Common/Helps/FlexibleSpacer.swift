//
//  FlexibleSpacer.swift
//  ReusEd
//
//  Created by Danila on 14.06.2022.
//

import SwiftUI

// Use instead of padding for virtual keyboard optimization
struct FlexibleSpacer: View {

    let minHeight: CGFloat
    let maxHeight: CGFloat

    var body: some View {
        Spacer()
            .frame(minHeight: minHeight, maxHeight: maxHeight)
    }
}
