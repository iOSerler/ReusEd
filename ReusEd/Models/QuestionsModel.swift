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
    var image: String
    var title: String
    var description: String
    var optionsData: [OptionData]
    
}
