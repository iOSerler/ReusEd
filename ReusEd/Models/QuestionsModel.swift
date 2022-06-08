//
//  QuestionsModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 08.06.2022.
//

import Foundation

struct QuestionData{
    var stepsImage: String
    var title: String
    var titleFont: String
    var titleColor: String
    var description: String
    var descriptionFont: String
    var descriptionColor: String
    var optionsData: [[String]]
    var optionsColor: String
    var buttonColor: String
    var buttonTextColor: String
}

var question1 = QuestionData(stepsImage: "Question1", title: "How did your hear about us?", titleFont: "", titleColor: "", description: "Tell us how you new about ReusEd to recommend it to more learners like you.", descriptionFont: "", descriptionColor: "", optionsData: [["", "", ], ["", ""]], optionsColor: "", buttonColor: "", buttonTextColor: "")
