//
//  CourseSectionView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct CourseSectionView: View {
    var settings: ViewAssets
    var category: Category
    
    
    @ObservedObject var coursesViewModel: CoursesViewModel

    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            HStack {
                Text(category.title!)
                    .font(Font.custom(settings.titleFont, size: 16))
                    .foregroundColor(Color(settings.mainTextColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.leading, 10)
                Spacer()
                NavigationLink(destination: CourseListView(
                    courses: coursesViewModel.getCoursesByCategory(categoryId: category.id!),
                    pageSettings: settings,
                    coursesViewModel: coursesViewModel,
                    coursesListType: "category",
                    title: category.title!)) {
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
                    ForEach(coursesViewModel.getCoursesByCategory(categoryId: category.id!)) { course in
                        CourseCardView(course: course, settings: settings, coursesViewModel: coursesViewModel, timeImage: icons.timeImage)
                    }
                }.frame(height: UIScreen.main.bounds.height/3.9)
            }
            
        }.frame(width: UIScreen.main.bounds.width - 20)
    }
}
