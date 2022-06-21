//
//  CoursesModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import Foundation


struct CourseSection: Identifiable, Decodable {
    var id: Int
    var title: String
    var lessons: [Int]
}


struct Course: Identifiable, Decodable {
    var id: Int?
    var title: String?
    var shortDescription: String?
    var longDescription: String?
    var duration: String?
    var progress: Double?
    var posterSmall: String?
    var posterBig: String?
    var isSaved: Bool?
    var isPopular: Bool?
    var categories: [Int]?
    var author: String?
    var sections: [CourseSection]?
    
}

struct Category: Identifiable, Decodable {
    var id: Int?
    var title: String?
    var courses: [Int]?
}


struct TextLessonData: Identifiable, Decodable {
    var id: Int?
    var text: String?
    var image: String?
}
struct TextLessonSection: Identifiable, Decodable {
    var id: Int
    var title: String
    var data: [TextLessonData]
}

struct VideoLessonStamp: Decodable {
    var seconds: Double
    var textTime: String
    var textDescription: String
}

struct Lesson: Identifiable, Decodable {
    var id: Int?
    var type: String?
    var title: String?
    var description: String?
    var duration: String?
    var progress: Double?
    var background: String?
    var sections: [TextLessonSection]?
    var url: String?
    var stamps: [VideoLessonStamp]?
    
}
