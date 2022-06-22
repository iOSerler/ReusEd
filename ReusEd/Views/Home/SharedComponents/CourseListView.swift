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
    @ObservedObject var coursesViewModel: CoursesViewModel
    var coursesListType: String
    
    var displayCourses: [Course] {
        switch coursesListType {
        case "popular":
            return courses.filter { $0.isPopular! && (searchText.isEmpty ? true : $0.title!.contains(searchText)) }
        case "saved":
            return courses.filter { $0.isSaved! && (searchText.isEmpty ? true : $0.title!.contains(searchText)) }
        default:
            return courses.filter { searchText.isEmpty ? true : $0.title!.contains(searchText) }
        }
    }
    
    var title = String()
    var title2: String {
        switch coursesListType {
        case "popular":
            return "Popular Courses"
        case "saved":
            return "Saved Courses"
        default:
            return "In Progress"
        }
    }
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            SearchBarView(settings: pageSettings,
                          searchText: $searchText)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 10) {
                    ForEach(displayCourses) { course in
                        NavigationLink(destination:
                                            CourseDetailView(course: course,
                                                             settings: pageSettings,
                                                             coursesViewModel: coursesViewModel,
                                                             isText: false
                                                            )
                        ) {
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
