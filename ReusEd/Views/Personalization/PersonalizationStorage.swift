//
//  PersonalizationCoordinator.swift
//  ReusEd
//
//  Created by Daniya on 11/06/2022.
//

import SwiftUI

var questions = [question1, question2, question3, question4]

var question1 = QuestionData(
    id: 1,
    type: "checkbox",
    // FIXME should NOT be a hardcoded image, rather a custom view
    stepsImage: "Question1",
    image: "",
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
    type: "checkbox",
    stepsImage: "Question2",
    image: "",
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
    type: "singleChoice",
    stepsImage: "Question3",
    image: "",
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
    type: "image",
    stepsImage: "Question4",
    image: "All-set",
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

var personalizationQuestionSelectedItemsDict = [Int: Set<Int>]()
