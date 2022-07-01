//
//  PersonalizationCoordinator.swift
//  ReusEd
//
//  Created by Daniya on 11/06/2022.
//

import SwiftUI
import PersonalizationQuestionsKit

struct Storage: PersonalizationStorage {
    func addCheckedOption(_ question: QuestionData, option: OptionData) {
        
        let storageID = "checkBoxQuestionID_\(question.id)"
        if var checkedOptions = UserDefaults.standard.array(forKey: storageID) as? [Int] {
            checkedOptions.append(option.id)
            checkedOptions = Array(Set(checkedOptions))
            UserDefaults.standard.set(checkedOptions, forKey: storageID)
        } else {
            UserDefaults.standard.set([option.id], forKey: storageID)
        }
        UserDefaults.standard.synchronize()
                
    }

    func removeCheckedOption(_ question: QuestionData, option: OptionData) {
        let storageID = "checkBoxQuestionID_\(question.id)"
        if var checkedOptions = UserDefaults.standard.array(forKey: storageID) as? [Int] {
            var set = Set(checkedOptions)
            set.remove(option.id)
            checkedOptions = Array(set)
            UserDefaults.standard.set(checkedOptions, forKey: storageID)
            UserDefaults.standard.synchronize()
        }
    }
    
    func isOptionChecked(_ question: QuestionData, option: OptionData) -> Bool {
        let storageID = "checkBoxQuestionID_\(question.id)"
        if let checkedOptions = UserDefaults.standard.array(forKey: storageID) as? [Int] {
            let set = Set(checkedOptions)
            return set.contains(option.id)
        }
        return false
    }
    
    func getChosenOption(_ question: QuestionData) -> Int {
        let storageID = "checkBoxQuestionID_\(question.id)"
        let chosenOption = UserDefaults.standard.integer(forKey: storageID)
        return chosenOption
    }
    
    func setChosenOption(_ question: QuestionData, option: OptionData) {
        let storageID = "checkBoxQuestionID_\(question.id)"
        UserDefaults.standard.set(option.id, forKey: storageID)
        UserDefaults.standard.synchronize()
    }
}


// FIXME: move to a json file and parse

var questions = [question1, question2, question3, question4]

var question1 = QuestionData(
    id: 1,
    type: "checkbox",
    image: "",
    title: "How did your hear about us?",
    description: "Tell us how you new about ReusEd to recommend it to more learners like you.",
    optionsData: [
        OptionData(id: 1, firstPart: "🤗", secondPart: "Friends/Family"),
        OptionData(id: 2, firstPart: "🔎", secondPart: "Google Search"),
        OptionData(id: 3, firstPart: "🏪", secondPart: "App Store"),
        OptionData(id: 4, firstPart: "📖", secondPart: "News/Arcticle/Blog"),
        OptionData(id: 5, firstPart: "📱", secondPart: "Facebook/Instagram"),
        OptionData(id: 6, firstPart: "🕺", secondPart: "TikTok"),
        OptionData(id: 7, firstPart: "🤔", secondPart: "Other")
    ]
    
)

var question2 = QuestionData(
    id: 2,
    type: "checkbox",
    image: "",
    title: "What’s your interest?",
    description: "Please tell us your interests to make sure we know your field of work.",
    optionsData: [
        OptionData(id: 1, firstPart: "🎓", secondPart: "Computer Science"),
        OptionData(id: 2, firstPart: "⚗️", secondPart: "Chemistry"),
        OptionData(id: 3, firstPart: "🔬", secondPart: "Biology"),
        OptionData(id: 4, firstPart: "📸", secondPart: "Cinematography"),
        OptionData(id: 5, firstPart: "➗", secondPart: "Mathematics"),
        OptionData(id: 6, firstPart: "🤔", secondPart: "Other")
    ]
)

var question3 = QuestionData(
    id: 3,
    type: "singleChoice",
    image: "",
    title: "Pick your learning goal",
    description: "Tell us how much time you’re willing to spend during your day learing.",
    optionsData: [
        OptionData(id: 1, firstPart: "Casual", secondPart: "5 min / day"),
        OptionData(id: 2, firstPart: "Regular", secondPart: "10 min / day"),
        OptionData(id: 3, firstPart: "Serious", secondPart: "15 min / day"),
        OptionData(id: 4, firstPart: "Intense", secondPart: "20 min / day")
    ]
)

var question4 = QuestionData(
    id: 4,
    type: "image",
    image: "All-set",
    title: "You’re all set!",
    description: "Welcome to ReusEd and enjoy your learning with our personalized courses.",
    optionsData: [OptionData]()
)
