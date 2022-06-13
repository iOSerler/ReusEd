//
//  RadioButtonList.swift
//  ReusEd
//
//  Created by Daniya on 12/06/2022.
//

import SwiftUI

struct RadioButtonList: View {

    let question: QuestionData
    @State var chosenOptionId: Int = 1

    var body: some View {
        ScrollView {
            ForEach(question.optionsData) { optionData in

                RadioButtonRow(
                    optionData: optionData,
                    tapAction: {
                        self.chosenOptionId = optionData.id
                    },
                    chosen: self.chosenOptionId == optionData.id
                    )
            }
            .padding(0)
        }
    }
}

struct RadioButtonRow: View {

    let optionData: OptionData
    let tapAction: () -> Void
    let chosen: Bool

    var body: some View {
        Button(
            action: {
                tapAction()
            }, label: {
                HStack {
                    Text(optionData.firstPart)
                        .font(.custom(question3.titleFont, size: 16))
                        .foregroundColor(chosen ? Color(question3.buttonColor) : .black)
                        .padding(.leading, 20)
                    Spacer()
                    Text(optionData.secondPart)
                        .font(.custom(question3.descriptionFont, size: 14))
                        .foregroundColor(
                            chosen ?
                            Color(question3.optionsColor) : Color(question3.descriptionColor)
                        )
                        .padding(.trailing, 20)
                }
                .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke(chosen ? Color(question3.buttonColor) : Color("border"), lineWidth: 2))
                .background(chosen ? Color("background2") : .white)
            }
        )
            .cornerRadius(12)
            .padding(.top, 10)
    }
}
