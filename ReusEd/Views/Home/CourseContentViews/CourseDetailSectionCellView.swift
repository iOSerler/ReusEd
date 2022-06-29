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
                        NavigationLink(destination: TextImageLessonView(settings: settings, textLesson: lesson, coursesViewModel: coursesViewModel)) {
                            CourseDetailTopicCellView(lesson: lesson, settings: settings, coursesViewModel: coursesViewModel)
                                .padding(.vertical, 10)
                        }
                    } else if lesson.type == "video"{
                        NavigationLink(destination: VideoLessonView(settings: settings, videoLesson: lesson, coursesViewModel: coursesViewModel)) {
                            CourseDetailTopicCellView(lesson: lesson, settings: settings, coursesViewModel: coursesViewModel)
                                .padding(.vertical, 10)
                            
                        }
                    } else {
                        NavigationLink(destination: QuizView(
                            settings: settings,
                            lesson: lesson,
                            coursesViewModel: coursesViewModel,
                            courseId: courseId
                        )) {
                            CourseDetailTopicCellView(lesson: lesson, settings: settings, coursesViewModel: coursesViewModel)
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
