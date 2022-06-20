//
//  CourseListView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct CourseListView: View {
    @State var courses: [Course]
    @State private var searchText: String = ""
    var pageSettings: ViewAssets
    var coursesListType: CoursesListType
    var displayCourses: [Course] {
        switch coursesListType {
        case .popular:
            return courses.filter { $0.isPopular && (searchText.isEmpty ? true : $0.title.contains(searchText)) }
        case .saved:
            return courses.filter { $0.isSaved && (searchText.isEmpty ? true : $0.title.contains(searchText)) }
        case .category:
            return courses.filter { searchText.isEmpty ? true : $0.title.contains(searchText) }
        }
    }
    
    var title = String()
    var title2: String {
        switch coursesListType {
        case .popular:
            return "Popular Courses"
        case .saved:
            return "Saved Courses"
        case .category:
            return title
        }
    }
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            SearchBarView(settings: pageSettings,
                          searchText: $searchText)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 10) {
                    ForEach(displayCourses) { course in
                        NavigationLink {
//                            CourseDetailView(courseId: course.id)
                            CourseDetailView(courseId: course.id, settings: pageSettings, isText: false, detail: course.detail)
                        } label: {
                            CourseListCellView(settings: pageSettings, course: course)
                        }
                        Divider()
                            .padding(.horizontal, 20)
                    }
                }
            }
        }.navigationTitle(title2)
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView(courses: courses, pageSettings: viewAssets, coursesListType: .popular)
    }
}
