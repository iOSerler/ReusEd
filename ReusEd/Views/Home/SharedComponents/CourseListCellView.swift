//
//  CourseListCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct CourseListCellView: View {
    var settings: ViewAssets
    @State var course: Course
    @State var progress: Double = 0.0
    @ObservedObject var coursesViewModel: CoursesViewModel
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                UrlImageView(urlString: course.posterSmall)
                    .frame(width: UIScreen.main.bounds.width / 5.3, height: UIScreen.main.bounds.width / 5.3)
                VStack(alignment: .leading) {
                    Text(course.title)
                        .font(.custom(settings.titleFont, size: 14))
                        .foregroundColor(Color(settings.mainTextColor))
                    Text(course.shortDescription)
                        .font(.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.descriptionTextColor))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    HStack(alignment: .center, spacing: 1) {
                        Image(viewAssets.timeImage)
                        Text(course.duration)
                            .font(.custom(settings.descriptionFont, size: 12))
                            .foregroundColor(Color(settings.primaryLightColor))
                            .padding(.leading, 5)
                        Spacer()
                        ProgressView(value: self.progress * 100, total: 100)
                            .scaleEffect(1.5, anchor: .center)
                            .accentColor(Color(settings.primaryLightColor))
                            .frame(width: UIScreen.main.bounds.width / 5)
                            .padding(.trailing, 30)
                        Text("\(Int((self.progress * 100).rounded())) %")
                            .font(.custom(settings.descriptionFont, size: 12))
                            .foregroundColor(Color(settings.mainTextColor))
                    }
                    .padding(.bottom, 1)
                    
                }
                .frame(height: 80)
                .padding(.leading, 10)
                
            }
            .padding(.horizontal, 20)
            .frame(height: 100)
            
        }
        .onDidAppear {
//            self.progress = coursesViewModel.saveCourseProgress(userId: 1, courseId: self.course.id)
            self.progress = coursesViewModel.getCourseProgress(userId: 1, courseId: self.course.id)
        }
    }
}
