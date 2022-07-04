//
//  CourseDetailSectionCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//

import SwiftUI
import LessonKit
import CourseCompletionKit

struct CourseDetailSectionCellView: View {
    var settings: ViewAssets
    @State var section: CourseSection
    @State var courseId: Int
    @Binding var showAlert: Bool
    @Binding var progress: Double
    @StateObject var lessonViewModel: LessonViewModel = LessonViewModel()
    @ObservedObject var coursesViewModel: CoursesViewModel
    @State var numPoints: Int = 0
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
                            NavigationLink(destination: TextImageLessonView(settings: settings, jsonName: "lessons", lessonId: lesson.id, lessonViewModel: lessonViewModel)) {
                                CourseDetailTopicCellView(lesson: lesson, settings: settings, coursesViewModel: coursesViewModel)
                                    .padding(.vertical, 10)
                            }
                        } else if lesson.type == "video"{
                            NavigationLink(destination: VideoLessonView(settings: settings, jsonName: "lessons", lessonId: lesson.id, lessonViewModel: lessonViewModel)) {
                                CourseDetailTopicCellView(lesson: lesson, settings: settings, coursesViewModel: coursesViewModel)
                                    .padding(.vertical, 10)
                                
                            }
                        } else if lesson.type == "finalQuiz"{
                            NavigationLink(destination: QuizView(settings: settings, jsonName: "lessons", lessonId: lesson.id, lessonViewModel: lessonViewModel, nextView: CompleteCourseView(settings: settings, courseTitle: coursesViewModel.courses[courseId-1].title, completionRate: $progress, numPoints: $numPoints), numPoints: $numPoints)) {
                                CourseDetailTopicCellView(lesson: lesson, settings: settings, coursesViewModel: coursesViewModel)
                                    .padding(.vertical, 10)
                                
                            }.disabled(progress >= 0.8 ? false: true)
                             .onTapGesture {
                                 if progress < 0.8 {
                                     showAlert.toggle()
                                 }
                             }
                        } else {
                            NavigationLink(destination: QuizView(settings: settings, jsonName: "lessons", lessonId: lesson.id, lessonViewModel: lessonViewModel, nextView: EmptyView(), numPoints: $numPoints)) {
                                CourseDetailTopicCellView(lesson: lesson, settings: settings, coursesViewModel: coursesViewModel)
                                    .padding(.vertical, 10)
                                
                            }
                        }
                        Divider()
                    }
                    
                }
                
                Spacer()
            }.onAppear {
                self.numPoints = 0
            }
    }
}
