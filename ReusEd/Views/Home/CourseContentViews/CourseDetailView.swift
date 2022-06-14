//
//  CourseDetailView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct CourseDetailView: View {
    @State var courseId: Int
    var body: some View {
        Text("Course detail, ID: \(courseId)")
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(courseId: 1)
    }
}
