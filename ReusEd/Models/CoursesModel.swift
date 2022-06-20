//
//  CoursesModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import Foundation





struct Course: Identifiable {
    var id: Int
    var title: String
    var description: String
    var posterBig: String
    var posterSmall: String
    var duration: String
    var progress: Double = 0.5
    var isSaved: Bool = true
    var isPopular: Bool = false
    var detail: CourseDetail?
}

struct Category: Identifiable {
    var id: Int
    var title: String
    var filterTitle: String?
}
var categories = [
    Category(
        id: 1,
        title: "New Courses",
        filterTitle: "🔥 New"
    ),
    Category(
        id: 2,
        title: "Programming",
        filterTitle: "⌨️ Programming"
    ),
    Category(
        id: 3,
        title: "Design",
        filterTitle: "🎨 Design"
    )
]



var categoryCourses = [
    1: [1, 3, 4],
    2: [2, 5, 7],
    3: [6]
]

enum CoursesListType {
    case saved
    case popular
    case category
}
