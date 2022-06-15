//
//  CoursesDetailModel.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//

import Foundation
enum TopicType {
    case document
    case video
    case quiz
}

struct CourseTopic: Identifiable {
    var id: Int
    var title: String
    var description: String
    var progress: Double
    var type: TopicType
    var content: TopicContent?
}

struct TopicContent {
    var text1: String?
}

struct CourseSection: Identifiable {
    var id: Int
    var title: String
    var topics: [CourseTopic]
}

struct CourseDetail: Identifiable {
    var id: Int
    var title: String
    var description: String
    var authorName: String
    var duration: String
    var sections: [CourseSection]
    
}
