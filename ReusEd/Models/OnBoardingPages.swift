//
//  OnBoardingPages.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import Foundation

struct Page : Identifiable {
    var id : Int
    var image : String
    var title : String
    var description : String
}

var pagesData = [
    Page(id: 0, image: "Book lover-bro 1", title: "Learn on your own pace", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever."),
    Page(id: 1, image: "Push notifications-amico 1", title: "Get Daily Reminders", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever."),
    Page(id: 2, image: "Grades-bro 1", title: "Earn Scores and Shop", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.")
]


