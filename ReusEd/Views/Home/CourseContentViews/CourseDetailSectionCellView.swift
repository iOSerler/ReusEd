//
//  CourseDetailSectionCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//

import SwiftUI

struct CourseDetailSectionCellView: View {
    var settings: ViewAssets
    @State var section: CourseSection
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(section.title)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.detailsTextColor))
                ForEach(section.topics) { topic in
                    NavigationLink(destination: TextImageLessonView(textImageLesson: textImageLesson)) {
                        CourseDetailTopicCellView(topic: topic, settings: settings)
                            .padding(.vertical, 10)
                    }
                    Divider()
                }
                
            }
            
            Spacer()
        }
        
        
    }
}
