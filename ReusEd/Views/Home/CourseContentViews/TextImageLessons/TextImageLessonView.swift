//
//  TextImageLessonView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

struct TextImageLessonView: View {
    var textImageLesson: TextImageLesson
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(textImageLesson.description)
                .font(.custom(lessonSettingsData.descriptionFont, size: 14))
                .foregroundColor(Color(lessonSettingsData.descriptionColor))
                .multilineTextAlignment(.leading)
            HStack {
                Image("time-past")
                
                Text(textImageLesson.duration)
                    .font(.custom(lessonSettingsData.descriptionFont, size: 14))
                    .foregroundColor(Color(lessonSettingsData.additionalTextColor))
                    .padding(.leading, 10)
                Spacer()
            }
            .padding(.leading, 20)
            
            VStack {
                ForEach(0..<textImageLesson.textImageSections.count, id: \.self) { ind in
                    TextImageLessonSectionView(textImageSection: textImageLesson.textImageSections[ind])
                }
            }.navigationTitle(textImageLesson.title)
                .navigationBarTitleDisplayMode(.inline)
                .padding(.horizontal, 20)
        }
    }
}

struct TextImageLessonView_Previews: PreviewProvider {
    static var previews: some View {
        TextImageLessonView(textImageLesson: textImageLesson)
    }
}
