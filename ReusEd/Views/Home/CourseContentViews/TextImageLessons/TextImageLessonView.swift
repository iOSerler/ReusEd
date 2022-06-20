//
//  TextImageLessonView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

struct TextImageLessonView: View {
    var settings: ViewAssets
    var textImageLesson: TextImageLesson
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(textImageLesson.description)
                .font(.custom(settings.descriptionFont, size: 14))
                .foregroundColor(Color(settings.descriptionTextColor))
                .multilineTextAlignment(.leading)
            HStack {
                Image(icons.durationOffIcon)
                
                Text(textImageLesson.duration)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.detailsTextColor))
                    .padding(.leading, 10)
                Spacer()
            }
            .padding(.leading, 20)
            
            VStack {
                ForEach(0..<textImageLesson.textImageSections.count, id: \.self) { ind in
                    TextImageLessonSectionView(settings: settings, textImageSection: textImageLesson.textImageSections[ind])
                }
            }.navigationTitle(textImageLesson.title)
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal, 20)
        }
    }
}
