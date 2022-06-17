//
//  TextImageLessonSection.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

struct TextImageLessonSectionView: View {
    @State var textImageSection: TextImageSection
    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Text(textImageSection.title)
                    .font(.custom(lessonSettingsData.titleFont, size: 16))
                    .padding(.bottom, 20)
                
                ForEach(0..<textImageSection.textImages.count, id: \.self) { ind in
                    TextImageView(textImage: textImageSection.textImages[ind])
                }
            }
//        }
       
    }
}
