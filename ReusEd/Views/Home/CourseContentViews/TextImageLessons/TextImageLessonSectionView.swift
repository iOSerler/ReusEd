//
//  TextImageLessonSection.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

struct TextImageLessonSectionView: View {
    var settings: ViewAssets
    @State var textImageSection: TextImageSection
    var body: some View {
        VStack(alignment: .leading) {
            Text(textImageSection.title)
                .font(.custom(settings.titleFont, size: 16))
                .padding(.bottom, 1)
            
            ForEach(0..<textImageSection.textImages.count, id: \.self) { ind in
                TextImageView(settings: settings, textImage: textImageSection.textImages[ind])
            }
        }
        .padding(.bottom, 30)
    }
}
