//
//  Question4View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct Question4View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack(alignment: .center) {

            Image(question4.stepsImage)
            Image("All-set")
                .padding(.top, UIScreen.main.bounds.height / 10)

            Text(question4.title)
                .font(Font.custom(question4.titleFont, size: 20))
                .foregroundColor(Color(question4.titleColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
            //                .padding(.top, UIScreen.main.bounds.height / 15)

            Text(question4.description)
                .font(Font.custom(question4.descriptionFont, size: 14))
                .foregroundColor(Color(question4.descriptionColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
                .padding(.horizontal)

            Spacer()

            Button(action: {

                // saving all data

                for index in question1SelectedItemsIdx {
                    question1Answers.append(question1.optionsData[index].secondPart)
                }
                for index in question2SelectedItemsIdx {
                    question2Answers.append(question2.optionsData[index].secondPart)
                }
                question3Answer = question3.optionsData[question3SelectedItemIdx - 1].firstPart
                print(question1Answers)
                print(question2Answers)
                print(question3Answer)

                UserDefaults.standard.set(question1Answers, forKey: "question1Answers")
                UserDefaults.standard.set(question2Answers, forKey: "question2Answers")
                UserDefaults.standard.set(question3Answer, forKey: "question3Answer")

                DispatchQueue.main.async {
                    withAnimation {
                        viewRouter.currentPage = .authorization
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
        //        .padding(.top)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Question4View_Previews: PreviewProvider {
    static var previews: some View {
        Question4View()
    }
}
