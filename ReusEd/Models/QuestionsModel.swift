//
//  QuestionsModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 08.06.2022.
//

import Foundation

struct OptionData: Identifiable{
    var id = UUID()
    var firstPart: String
    var secondPart: String
}

struct QuestionData{
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

var question1 = QuestionData(stepsImage: "Question1", title: "How did your hear about us?", titleFont: "Rubik-Medium", titleColor: "MainText", description: "Tell us how you new about ReusEd to recommend it to more learners like you.", descriptionFont: "Rubik-Regular", descriptionColor: "Gray", optionsData: [OptionData(firstPart: "🤗", secondPart: "Friends/Family"), OptionData(firstPart: "🔎", secondPart: "Google Search"), OptionData(firstPart: "🏪", secondPart: "App Store"), OptionData(firstPart: "📖", secondPart: "News/Arcticle/Blog"), OptionData(firstPart: "📱", secondPart: "Facebook/Instagram"), OptionData(firstPart: "🕺", secondPart: "TikTok"), OptionData(firstPart: "🤔", secondPart: "Other")], optionsColor: "MainText", buttonColor: "Primary", buttonTextColor: "White")

var question2 = QuestionData(stepsImage: "Question2", title: "What’s your interest?", titleFont: "Rubik-Medium", titleColor: "MainText", description: "Please tell us your interests to make sure we know your field of work.", descriptionFont: "Rubik-Regular", descriptionColor: "Gray", optionsData: [OptionData(firstPart: "🎓", secondPart: "Computer Science"), OptionData(firstPart: "⚗️", secondPart: "Chemistry"), OptionData(firstPart: "🔬", secondPart: "Biology"), OptionData(firstPart: "📸", secondPart: "Cinematography"), OptionData(firstPart: "➗", secondPart: "Mathematics"), OptionData(firstPart: "🤔", secondPart: "Other")], optionsColor: "MainText", buttonColor: "Primary", buttonTextColor: "White")


