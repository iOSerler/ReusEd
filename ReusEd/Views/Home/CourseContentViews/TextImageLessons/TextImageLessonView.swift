//
//  TextImageLessonView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

struct TextImageLessonView: View {
    var settings: ViewAssets
    var textLesson: Lesson
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(textLesson.description)
                .font(.custom(settings.descriptionFont, size: 14))
                .foregroundColor(Color(settings.descriptionTextColor))
                .multilineTextAlignment(.leading)
            HStack {
                Image(icons.durationOffIcon)
                
                Text(textLesson.duration)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.detailsTextColor))
                    .padding(.leading, 10)
                Spacer()
            }
            .padding(.leading, 20)
            
            VStack {
                ForEach(textLesson.sections!) { section in
                    TextImageLessonSectionView(settings: settings, section: section)
                }
            }.navigationTitle(textLesson.title)
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal, 20)
        }
    }
}
