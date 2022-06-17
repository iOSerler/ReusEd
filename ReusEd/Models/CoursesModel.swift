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



struct CourseAssets {
    var authorIcon: String?
    var authorTextFont: String?
    var authorTextColor: String?
    var titleFont: String?
    var descriptionFont: String?
    var titleColor: String?
    var descriptionColor: String?
    var durationOnIcon: String?
    var durationOffIcon: String?
    var beginCourseButtonIcon: String?
    var beginCourseButtonFont: String?
    var beginCourseButtonTextColor: String?
    var courseDetailBackground: String?
    var videoIcon: String?
    var documentIcon: String?
    var quizIcon: String?
    var topicTitleFont: String?
    var topicTitleColor: String?
    var topicDescriptionFont: String?
    var topicDescriptionColor: String?
    var sectionNameFont: String?
    var sectionNameColor: String?
    
}

var courseDetailAssets = CourseAssets(
    authorIcon: "author",
    authorTextFont: "Rubik-Regular",
    authorTextColor: "Grey2",
    titleFont: "Rubik-Medium",
    descriptionFont: "Rubik-Regular",
    titleColor: "MainText",
    descriptionColor: "Grey",
    durationOffIcon: "time-past",
    beginCourseButtonIcon: "Polygon",
    beginCourseButtonFont: "Rubik-Medium",
    beginCourseButtonTextColor: "White",
    courseDetailBackground: "courseBackground",
    videoIcon: "film",
    documentIcon: "document",
    quizIcon: "resources",
    topicTitleFont: "Rubik-Medium",
    topicTitleColor: "MainText",
    topicDescriptionFont: "Rubik-Regular",
    topicDescriptionColor: "Grey",
    sectionNameFont: "Rubik-Regular",
    sectionNameColor: "Grey"
)
