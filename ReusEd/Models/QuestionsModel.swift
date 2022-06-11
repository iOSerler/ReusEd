//
//  QuestionsModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 08.06.2022.
//

import Foundation

struct OptionData: Identifiable, Equatable {
    var id: Int
    var firstPart: String
    var secondPart: String
}

struct QuestionData {
    var id: Int
    var type: String
    var stepsImage: String
    var title: String
    var titleFont: String
    var titleColor: String
    var description: String
    var descriptionFont: String
    var descriptionColor: String
    var optionsData: [OptionData]
    var optionsColor: String
    var buttonColor: String
    var buttonTextColor: String
}
