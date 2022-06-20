//
//  TextImage.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

struct TextImageView: View {
    var settings: ViewAssets
    var textImage: TextImage
    
    var body: some View {
        VStack(alignment: .leading) {
            if let text = textImage.text {
                Text(text)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.mainTextColor))
                    .padding(.horizontal, 0)
                    .multilineTextAlignment(.leading)
            }
            if let image = textImage.image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
