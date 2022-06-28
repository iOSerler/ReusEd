//
//  QuizQuestionView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/28/22.
//

import SwiftUI

struct QuizQuestionView: View {
    var settings: ViewAssets
    @State var progress: Double = 10.0

    @State var showResult: Bool = false
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Button {
                    print("X pressed")
                } label: {
                    Image(icons.cross)
                }
                .disabled(true)
                
                ProgressView(value: self.progress, total: 100)
                    .accentColor(self.progress != 100 ? Color(settings.primaryColor) : Color(.green))
                    .padding(.horizontal, 20)
                HStack {
                    Image(icons.asteriks)
                    Text("12")
                        .font(.custom(settings.titleFont, size: 14))
                        .foregroundColor(.white)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color(settings.pinkAccentColor))
                .clipShape(Capsule())
            }
            
            HStack {
                Text("Question \(2) of \(10)")
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.detailsTextColor))
                    .padding(.top, 10)
                Spacer()
            }
            
            
            Text("What is a correct syntax to output \"Hello World\" in Python?")
                .font(.custom(settings.titleFont, size: 16))
                .foregroundColor(Color(settings.mainTextColor))
                .padding(.top, 10)
                .multilineTextAlignment(.leading)
            
            VStack {
                SingleChoiceButtonList(
                    settings: settings,
                    answers: ["dsfbhsdf", "sdfg", "sdfgsdfg", "sdfgsdf"],
                    correctAnswer: ["sdfg"],
                    showResult: showResult)
            }
            .disabled(showResult ? true : false)
            
            Spacer()
            
            Button(
                action: {
                    self.showResult = true
                }, label: {
                    Text(showResult ? "Next Question" : "Check Answer")
                        .font(Font.custom(viewAssets.titleFont, size: 16))
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .background(Color(viewAssets.primaryColor))
                        .accentColor(Color(viewAssets.buttonTextColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }
            )

            
        }
        .padding(.horizontal, 20)
    }
}

struct QuizQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuizQuestionView(settings: viewAssets)
    }
}

struct SingleChoiceButtonList: View {
    var settings: ViewAssets
    let answers: [String]
    let correctAnswer: [String]
    @State var chosenAnswer: String = ""
    var showResult: Bool
    
    var body: some View {
        ScrollView {
            ForEach(answers, id: \.self) { answer in
                SingleChoiceButtonRow(
                    settings: settings,
                    answer: answer,
                    tapAction: {
                        self.chosenAnswer = answer
                    },
                    chosen: chosenAnswer == answer,
                    showResult: self.showResult,
                    isCorrect: self.isCorrect(answer: answer))
                
            }
            .padding(0)
        }
    }
    
    func isCorrect(answer: String) -> Bool {
        for ans in self.correctAnswer where answer == ans {
                return true
        }
        return false
    }
}

struct SingleChoiceButtonRow: View {
    var settings: ViewAssets
    let answer: String
    let tapAction: () -> Void
    let chosen: Bool
    let showResult: Bool
    let isCorrect: Bool
    
    var body: some View {
        Button(
            action: {
                tapAction()
            }, label: {
                HStack {
                    Text(answer)
                        .font(.custom(settings.titleFont, size: 16))
                        .foregroundColor(chosen ? Color(settings.primaryColor) : .black)
                        .padding(.leading, 20)
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        showResult ? (isCorrect ? settings.successMain : (chosen ? settings.errorMain : Color(settings.borderColor))) :
                                        (chosen ? Color(settings.primaryColor) : Color(settings.borderColor)), lineWidth: 2))
                
                .background(
                    showResult ? (isCorrect ? settings.successLighter : (chosen ? settings.errorLighter : .white)) : (chosen ? Color(settings.primaryLighterColor) : .white))
                    
            }
        )
        .cornerRadius(12)
        .padding(.top, 10)
    }
}
