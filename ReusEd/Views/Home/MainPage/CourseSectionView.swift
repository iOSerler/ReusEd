//
//  CourseSectionView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct CourseSectionView: View {
    var settings: ViewAssets
    var categoryId: Int
    @ObservedObject var coursesViewModel = CoursesViewModel(
        courses: courses,
        categories: categories,
        categoryCourses: categoryCourses)
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            HStack {
                Text(coursesViewModel.categories[categoryId-1].title)
                    .font(Font.custom(settings.titleFont, size: 16))
                    .foregroundColor(Color(settings.mainTextColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.leading, 10)
                Spacer()
                NavigationLink(destination: CourseListView(
                    courses: coursesViewModel.getCoursesByCategory(categoryId: categoryId),
                    pageSettings: settings,
                    coursesListType: .category,
                    title: coursesViewModel.categories[categoryId-1].title)) {
                    Text("View All")
                        .font(Font.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.primaryLightColor))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.trailing, 10)
                    }.navigationBarHidden(true)
               
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: UIScreen.main.bounds.width/20) {
                    ForEach(Array(coursesViewModel.categoryCourses[categoryId]!).sorted(by: <), id: \.self) {ind in
                        CourseCardView(course: coursesViewModel.courses[ind - 1], settings: settings, timeImage: icons.timeImage)
                    }
                }.frame(height: UIScreen.main.bounds.height/3.9)
            }
            
        }.frame(width: UIScreen.main.bounds.width - 20)
    }
}
