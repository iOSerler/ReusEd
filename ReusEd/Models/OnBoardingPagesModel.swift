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
    var titleColor: String
    var descriptionColor: String
    var buttonColor: String
    var buttonTextColor: String
    var buttonImage: String
    var titleFont: String
    var descriptionFont: String
    var capsuleOffColor:String
    
}

var introductionPagesData = [
    Page(id: 0, image: "Book lover-bro 1", title: "Learn on your own pace", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.", titleColor: "MainText", descriptionColor: "Gray", buttonColor: "Primary", buttonTextColor: "White", buttonImage: "arrow-right", titleFont: "Rubik-Medium", descriptionFont: "Rubik-Regular", capsuleOffColor: "background2"),
    Page(id: 1, image: "Push notifications-amico 1", title: "Get Daily Reminders", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.", titleColor: "MainText", descriptionColor: "Gray", buttonColor: "Primary", buttonTextColor: "White", buttonImage: "arrow-right", titleFont: "Rubik-Medium", descriptionFont: "Rubik-Regular", capsuleOffColor: "background2"),
    Page(id: 2, image: "Grades-bro 1", title: "Earn Scores and Shop", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.", titleColor: "MainText", descriptionColor: "Gray", buttonColor: "Primary", buttonTextColor: "White", buttonImage: "arrow-right", titleFont: "Rubik-Medium", descriptionFont: "Rubik-Regular", capsuleOffColor: "background2")
]


