//
//  SavedCoursesListView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct SavedCoursesListView: View {
    @State var courses: [Course]
    var coursesListType: CoursesListType
    var body: some View {
        NavigationView {
            CourseListView(courses: courses, coursesListType: .saved)
        }
    }
}

struct SavedCoursesListView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCoursesListView(courses: courses, coursesListType: .saved)
    }
}
