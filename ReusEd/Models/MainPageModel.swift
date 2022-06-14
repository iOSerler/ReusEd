//
//  MainPageModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import Foundation

struct MainPageData {
    var titleFont: String
    var descriptionFont: String
    var titleColor: String
    var descriptionColor: String
    var timeImage: String
    var additionalTextColor: String
    var filterButtonColor: String
}

var mainPageData = MainPageData(
    titleFont: "Rubik-Medium",
    descriptionFont: "Rubik-Regular",
    titleColor: "MainText",
    descriptionColor: "Gray",
    timeImage: "timer",
    additionalTextColor: "Primary",
    filterButtonColor: "PrimaryLight")
