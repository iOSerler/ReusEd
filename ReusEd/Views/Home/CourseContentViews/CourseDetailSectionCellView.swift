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
    @State var courseId: Int
    @ObservedObject var coursesViewModel: CoursesViewModel
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(section.title)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.detailsTextColor))
                ForEach(
                    coursesViewModel.getLessonsBySection(
                        courseId: courseId,
                        sectionId: section.id
                    )
                ) { lesson in
                    if lesson.type == "text" {
                        NavigationLink(destination: TextImageLessonView(settings: settings, textLesson: lesson)) {
                            CourseDetailTopicCellView(lesson: lesson, settings: settings)
                                .padding(.vertical, 10)
                        }
                    } else {
                        NavigationLink(destination: VideoLessonView(settings: settings, videoLesson: lesson)) {
                            CourseDetailTopicCellView(lesson: lesson, settings: settings)
                                .padding(.vertical, 10)
                            
                        }
                    }

                    
                    Divider()
                }
                
            }
            
            Spacer()
        }
        
        
    }
}
