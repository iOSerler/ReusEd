//
//  SearchView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 20.06.2022.
//

import SwiftUI

struct SearchView: View {
    var settings: ViewAssets
    @ObservedObject var coursesViewModel: CoursesViewModel
    var body: some View {
        VStack {
            CourseListView(courses: coursesViewModel.courses, pageSettings: settings, coursesViewModel: coursesViewModel, coursesListType: "category")
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(settings: viewAssets)
//    }
//}
