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

var courses = [
    Course(
        id: 1,
        title: "Python Porgramming",
        description: "Lorusd sdfgweirdffgh dhdfghdfsghdsfghfdghsdfh kehrbg websdsh",
        posterBig: "bigPoster3",
        posterSmall: "smallPoster1",
        duration: "3h 45 min",
        progress: 0.7,
        isPopular: true
    ),
    Course(
        id: 2,
        title: "C++ Porgramming",
        description: "Lorusd sdfgweirdf kehrdfghdsfgh dfsgh dsfghdfgbg websdsh",
        posterBig: "bigPoster1",
        posterSmall: "smallPoster2",
        duration: "3h 45 min",
        isPopular: true
    ),
    Course(
        id: 3,
        title: "Swift Porgramming",
        description: "Lorusd sdfgweirdf kehrdsfghdsfh dsfhbg websdsh",
        posterBig: "bigPoster4",
        posterSmall: "smallPoster3",
        duration: "3h 45 min",
        progress: 0.4,
        isPopular: true
    ),
    Course(
        id: 4,
        title: "Java Porgramming",
        description: "Lorusd sdfgweirdf kehdfgh dfgrbg websdsh",
        posterBig: "bigPoster1",
        posterSmall: "smallPoster4",
        duration: "3h 45 min",
        progress: 0.3,
        isSaved: true
    ),
    Course(
        id: 5,
        title: "Drawing",
        description: "Lorusd sdfgweirdf kehrdfgh dfgbg websdsh",
        posterBig: "bigPoster2",
        posterSmall: "smallPoster5",
        duration: "3h 45 min",
        progress: 0.9,
        isPopular: true
    ),
    Course(
        id: 6,
        title: "Snowboarding",
        description: "Lorusd sdfgweirdf dfgh dfgh dgfh websdsh",
        posterBig: "bigPoster3",
        posterSmall: "smallPoster1",
        duration: "3h 45 min",
        progress: 0.7,
        isSaved: true
    ),
    Course(
        id: 7,
        title: "Dancing",
        description: "Lorusd sdfgweirdf kehrbg websdsh",
        posterBig: "bigPoster3",
        posterSmall: "smallPoster2",
        duration: "3h 45 min",
        isSaved: true
        
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
