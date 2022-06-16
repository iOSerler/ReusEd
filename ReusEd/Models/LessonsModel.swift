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
    var textTime: String
    var textDescription: String
}

var videoLesson = VideoLesson(
    id: 1,
    url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
    title: "Summary",
    description: """
    Python programming language provides the following types of loops to handle looping requirements.
    Python provides three ways for executing the loops. While all the ways provide similar basic functionality,
    they differ in their syntax and condition checking time.
    """,
    duration: "15 min video",
    durationImage: "timer",
    stamps: [Stamp(seconds: 0, textTime: "0:00", textDescription: "Introduction to Loops"),
             Stamp(seconds: 120, textTime: "2:00", textDescription: "While Loop"),
             Stamp(seconds: 180, textTime: "3:00", textDescription: "For Loop - 1"),
             Stamp(seconds: 195, textTime: "3:15", textDescription: "For Loop - 2"),
             Stamp(seconds: 240, textTime: "4:00", textDescription: "For Loop - 3"),
             Stamp(seconds: 480, textTime: "8:00", textDescription: "Conclusion and Recap")]
)

struct LessonSettingsData {
    var titleFont: String
    var descriptionFont: String
    var titleColor: String
    var descriptionColor: String
    var timeImage: String
    var additionalTextColor: String
    var timeStampsColor: String
    var copyrightText: String
    var copyrightColor: String
    var previousBottonImage: String
    var nextButtonImage: String
    var priviousButtonText: String
    var nextButtonText: String
}

var lessonSettingsData = LessonSettingsData(
    titleFont: "Rubik-Medium",
    descriptionFont: "Rubik-Regular",
    titleColor: "MainText",
    descriptionColor: "Grey",
    timeImage: "timer",
    additionalTextColor: "Grey2",
    timeStampsColor: "Primary",
    timeStampsColor: "Primary",
    copyrightText: "Copyright © ReusEd 2022, Inc. All rights reserved worldwide",
    copyrightColor: "Grey3",
    previousBottonImage: "Previous",
    nextButtonImage: "Next",
    priviousButtonText: "Previous",
    nextButtonText: "Next"
    )


struct TextImageLesson: Identifiable {
    var id: Int
    var title: String
    var description: String
    var textImageSections: [TextImageSection]
    
}

struct TextImageSection: Identifiable {
    var id: Int?
    var title: String
    var textImages: [TextImage]
    
}

struct TextImage: Identifiable {
    var id: Int?
    var text: String? = ""
    var image: String? = ""
}


var textImageLesson = TextImageLesson(
    id: 1,
    title: "Control Flow",
    description: "dfgthdsfghdfghdf dfht dfgthdfhrdhd fdsfsdf sdfhsdfdfh",
    textImageSections: [
        TextImageSection(
            title: "1. dsfgbs sdfgsfdg", textImages: [
                TextImage(text: "skdhfbgklssdfgsdfgsdfgsdfg serfg sdfgsdfg sdfg sdfg sdfg sdfg sdfgdfhbgk sdhfbg isdfgikshbhdfkbglskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "bigPoster2"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg ifgj dfgyj dfyhj frhjdfhykj dfgjnxdgjdftjdfsdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg")
            ]
        ),
        TextImageSection(
            title: "2. sdfgrsdfgsdfg", textImages: [
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgiksdfgsdfg sdfg sdfgsdfgs drtgsdfgsdf gsdfg sdfgsdfg sdfgsdfgsdfgshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna")
            ]
        ),
        TextImageSection(
            title: "3. dsfgrefrtghsdfghdsf", textImages: [
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna")
            ]
        ),
        TextImageSection(
            title: "4. sdfrg sdrthygsdfg sdf", textImages: [
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbsdgrsdrf gsdfgsdfgsdf gsdfhsd hdfyghikj fcghk fgjxdfgjdfgjdfgjgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna"),
                TextImage(text: "skdhfbgklsdfhbgk sdhfbg isdfgikshbhdfkbgfk hbgsio drghdlskfjbg skldfjg ikdssdfg sdfg sdfgsdfg sdfg sdfgsdfgsdfg sdfg", image: "Anna")
            ]
        )
    ]
)
