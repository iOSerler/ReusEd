//
//  Question1View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct CheckboxQuestionView: View {

    let question: QuestionData

    var body: some View {

        VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15) {
            Image(question.stepsImage)

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

            List {
                ForEach(question.optionsData) { optionData in

                    RowView(
                        optionData: optionData,
                        tapAction: { checked in
                            if checked {
                                checkboxQuestionSelectedItemsDict[question.id]?.insert(optionData.id)

                            } else {
                                checkboxQuestionSelectedItemsDict[question.id]?.remove(optionData.id)
                            }
                        },
                        checked: checkboxQuestionSelectedItemsDict[question.id]?.contains(optionData.id) ?? false
                    )
                        .padding()
                        .listRowSeparator(.visible, edges: .bottom)
                        .listRowSeparator(.hidden, edges: .all)
                }
            }.listStyle(.plain)

            Spacer()

            // FIXME: add generic transition to the next view in line
            NavigationLink(destination: Question3View()) {
                Text("Continue")
                    .font(Font.custom(question1.titleFont, size: 16))
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .foregroundColor(Color(question1.buttonTextColor))
                    .background(Color(question1.buttonColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/30)
            }.simultaneousGesture(TapGesture().onEnded {

                guard let selectedItems = checkboxQuestionSelectedItemsDict[question.id] else {
                    return
                }

                UserDefaults.standard.set(selectedItems, forKey: "checkBoxQuestionID_\(question.id)")
            })
        }.padding(.top, UIScreen.main.bounds.height/20)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true).transition(.opacity)
            .onAppear {
                UserDefaults.standard.set(true, forKey: "NotificationPermissionPassed")
            }
    }
}

struct RowView: View {

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

struct Question1View_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxQuestionView(question: question1)
    }
}
