//
//  SavedCoursesListView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct SavedCoursesListView: View {
    @State var courses: [Course]
    @State private var selectedSegment = 0
    var coursesListType: CoursesListType
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedSegment) {
                    Text("Saved").tag(0)
                    Text("Popular").tag(1)
                    Text("In Progress").tag(2)
                    
                }
                .pickerStyle(.segmented)
                
                CourseListView(courses: courses, coursesListType: {
                    switch selectedSegment {
                    case 0:
                        return .saved
                    case 1:
                        return .popular
                    default:
                        return .saved
                    }
                }())
            }
        }
    }
}

struct SavedCoursesListView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCoursesListView(courses: courses, coursesListType: .saved)
    }
}
