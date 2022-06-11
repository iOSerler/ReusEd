//
//  Question1View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct PersonalizationQuestionView: View {

    @EnvironmentObject var viewRouter: ViewRouter

    let question: QuestionData

    var body: some View {

        VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15) {
            Image(question.stepsImage)

            if !question.image.isEmpty {
                Image(question.image)
                    .padding(.top, UIScreen.main.bounds.height / 10)
            }

            Text(question.title)
                .font(Font.custom(question.titleFont, size: 20))
                .foregroundColor(Color(question.titleColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)

            Text(question.description)
                .font(Font.custom(question.descriptionFont, size: 14))
                .foregroundColor(Color(question.descriptionColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
                .padding(.horizontal)

            if question.type == "checkbox" {
                CheckboxList(question: question)
            } else if question.type == "singleChoice" {
                RadioButtonList(question: question)
            }
            Spacer()

            if questions.count > 0 {

                NavigationLink(destination: PersonalizationQuestionView(question: questions.removeFirst())) {
                    Text("Continue")
                        .font(Font.custom(question1.titleFont, size: 16))
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .foregroundColor(Color(question1.buttonTextColor))
                        .background(Color(question1.buttonColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }.simultaneousGesture(TapGesture().onEnded {

                    guard let selectedItems = personalizationQuestionSelectedItemsDict[question.id] else {
                        return
                    }

                    UserDefaults.standard.set(selectedItems, forKey: "checkBoxQuestionID_\(question.id)")
                })

            } else {
                Button(action: {
                    self.saveAnswerData()

                    DispatchQueue.main.async {
                        withAnimation {
                            // FIXME: should not know about authorization
                            viewRouter.completePersonalization()
                        }
                    }
                }, label: {
                    Text("Done")
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .font(Font.custom(question4.titleFont, size: 16))
                        .background(Color(notificationPermissionData.buttonColor))
                        .accentColor(Color(notificationPermissionData.buttonTextColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                })
            }

        }.padding(.top, UIScreen.main.bounds.height/20)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true).transition(.opacity)
    }

    func saveAnswerData() {

        // FIXME: add saving onboarding data

        for key in personalizationQuestionSelectedItemsDict.keys {
            print(personalizationQuestionSelectedItemsDict[key] ?? "")
        }

    }
}

struct CheckboxList: View {

    let question: QuestionData

    var body: some View {
        List {
            ForEach(question.optionsData) { optionData in

                CheckboxRow(
                    optionData: optionData,
                    tapAction: { checked in
                        if checked {
                            personalizationQuestionSelectedItemsDict[question.id]?.insert(optionData.id)

                        } else {
                            personalizationQuestionSelectedItemsDict[question.id]?.remove(optionData.id)
                        }
                    },
                    checked: personalizationQuestionSelectedItemsDict[question.id]?.contains(optionData.id) ?? false
                )
                    .padding()
                    .listRowSeparator(.visible, edges: .bottom)
                    .listRowSeparator(.hidden, edges: .all)
            }
        }.listStyle(.plain)
    }
}

struct CheckboxRow: View {

    let optionData: OptionData
    let tapAction: (Bool) -> Void

    @State var checked: Bool

    var body: some View {
        HStack {
            self.checked ? Image("checkbox-full") : Image("checkbox-empty")
            Text(optionData.firstPart)
                .padding(.leading, 10)
            Text(optionData.secondPart)
            Spacer()
        }.contentShape(Rectangle())
        .onTapGesture(perform: {
            checked.toggle()
            tapAction(checked)

        })
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

struct Question1View_Previews: PreviewProvider {
    static var previews: some View {
        PersonalizationQuestionView(question: question1)
    }
}
