//
//  LessonsModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import Foundation

struct VideoLesson: Identifiable {
    var id: Int
    var url: String
    var title: String
    var description: String
    var duration: String
    var durationImage: String
    var stamps: [Stamp]
}

struct Stamp {
    var seconds: Double
    var text: String
}

var videoLesson = VideoLesson(
    id: 1,
    url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
    title: "Summary",
    description: """
    Python programming language provides the following types of loops to handle looping requirements.
    Python provides three ways for executing the loops. While all the ways provide similar basic functionality,
    they differ in their syntax and condition checking time.
    """,
    duration: "15 seconds",
    durationImage: "timer",
    stamps: [Stamp(seconds: 1, text: "0:00 : Introduction to Loops"),
             Stamp(seconds: 2, text: "2:00 : While Loop"),
             Stamp(seconds: 3, text: "3:00 : For Loop - 1"),
             Stamp(seconds: 4, text: "3:00 : For Loop - 2"),
             Stamp(seconds: 5, text: "4:00 : For Loop - 3"),
             Stamp(seconds: 8, text: "8:00 : Conclusion and Recap")]
)
