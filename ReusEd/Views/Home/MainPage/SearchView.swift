//
//  SearchView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 20.06.2022.
//

import SwiftUI

struct SearchView: View {
    var settings: ViewAssets
    var body: some View {
        VStack {
            CourseListView(courses: courses, pageSettings: settings, coursesListType: .category)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(settings: viewAssets)
    }
}
