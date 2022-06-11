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

var question1 = QuestionData(
    id: 1,
    // FIXME should NOT be a hardcoded image, rather a custom view
    stepsImage: "Question1",
    title: "How did your hear about us?",
    titleFont: "Rubik-Medium",
    titleColor: "MainText",
    description: "Tell us how you new about ReusEd to recommend it to more learners like you.",
    descriptionFont: "Rubik-Regular",
    descriptionColor: "Gray",
    optionsData: [
        OptionData(id: 1, firstPart: "🤗", secondPart: "Friends/Family"),
        OptionData(id: 2, firstPart: "🔎", secondPart: "Google Search"),
        OptionData(id: 3, firstPart: "🏪", secondPart: "App Store"),
        OptionData(id: 4, firstPart: "📖", secondPart: "News/Arcticle/Blog"),
        OptionData(id: 5, firstPart: "📱", secondPart: "Facebook/Instagram"),
        OptionData(id: 6, firstPart: "🕺", secondPart: "TikTok"),
        OptionData(id: 7, firstPart: "🤔", secondPart: "Other")
    ],
    optionsColor: "MainText",
    buttonColor: "Primary",
    buttonTextColor: "White"
)

var question2 = QuestionData(
    id: 2,
    stepsImage: "Question2",
    title: "What’s your interest?",
    titleFont: "Rubik-Medium",
    titleColor: "MainText",
    description: "Please tell us your interests to make sure we know your field of work.",
    descriptionFont: "Rubik-Regular",
    descriptionColor: "Gray",
    optionsData: [
        OptionData(id: 1, firstPart: "🎓", secondPart: "Computer Science"),
        OptionData(id: 2, firstPart: "⚗️", secondPart: "Chemistry"),
        OptionData(id: 3, firstPart: "🔬", secondPart: "Biology"),
        OptionData(id: 4, firstPart: "📸", secondPart: "Cinematography"),
        OptionData(id: 5, firstPart: "➗", secondPart: "Mathematics"),
        OptionData(id: 6, firstPart: "🤔", secondPart: "Other")
    ],
    optionsColor: "MainText",
    buttonColor: "Primary",
    buttonTextColor: "White"
)

var question3 = QuestionData(
    id: 3,
    stepsImage: "Question3",
    title: "Pick your learning goal",
    titleFont: "Rubik-Medium",
    titleColor: "MainText",
    description: "Tell us how much time you’re willing to spend during your day learing.",
    descriptionFont: "Rubik-Regular",
    descriptionColor: "Gray",
    optionsData: [
        OptionData(id: 1, firstPart: "Casual", secondPart: "5 min / day"),
        OptionData(id: 2, firstPart: "Regular", secondPart: "10 min / day"),
        OptionData(id: 3, firstPart: "Serious", secondPart: "15 min / day"),
        OptionData(id: 4, firstPart: "Intense", secondPart: "20 min / day")
    ],
    optionsColor: "MainText",
    buttonColor: "Primary",
    buttonTextColor: "White"
)

var question4 = QuestionData(
    id: 4,
    stepsImage: "Question4",
    title: "You’re all set!",
    titleFont: "Rubik-Medium",
    titleColor: "MainText",
    description: "Welcome to ReusEd and enjoy your learning with our personalized courses.",
    descriptionFont: "Rubik-Regular",
    descriptionColor: "Gray",
    optionsData: [OptionData](),
    optionsColor: String(),
    buttonColor: "Primary",
    buttonTextColor: "White"
)

var checkboxQuestionSelectedItemsDict = [Int: Set<Int>]()

var question3SelectedItemIdx = Int()

var question1Answers = [String]()
var question2Answers = [String]()
var question3Answer = String()
