//
//  Question1View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct Question1View: View {
    var body: some View {

        VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15) {
            Image(question1.stepsImage)

            Text(question1.title)
                .font(Font.custom(question1.titleFont, size: 20))
                .foregroundColor(Color(question1.titleColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)

            Text(question1.description)
                .font(Font.custom(question1.descriptionFont, size: 14))
                .foregroundColor(Color(question1.descriptionColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
                .padding(.horizontal)

            List {
                ForEach(question1.optionsData.indices, id: \.self) { index in
                    RowView(
                        id: question1.optionsData.firstIndex(of: question1.optionsData[index])!,
                        firstPart: question1.optionsData[index].firstPart,
                        secondPart: question1.optionsData[index].secondPart,
                        tapped: question1SelectedItemsBool[index],
                        questionId: 1
                    )
                        .padding()
                        .listRowSeparator(.visible, edges: .bottom)
                        .listRowSeparator(.hidden, edges: .all)
                }
            }.listStyle(.plain)

            Spacer()

            NavigationLink(destination: Question2View()) {
                Text("Continue")
                    .font(Font.custom(question1.titleFont, size: 16))
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .foregroundColor(Color(question1.buttonTextColor))
                    .background(Color(question1.buttonColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/30)
            }.simultaneousGesture(TapGesture().onEnded {

                // saving question 1 answers to global variable
                question1SelectedItemsIdx = question1SelectedItemsIdxTemp
                question1SelectedItemsBool = [Bool]()
                for _ in 0...question1.optionsData.count - 1 {
                    question1SelectedItemsBool.append(false)
                }
                for item in question1SelectedItemsIdx {
                    question1SelectedItemsBool[item] = true
                }
                //                    print(question1SelectedItemsBool)
                UserDefaults.standard.set(question1SelectedItemsIdx, forKey: "question1SelectedIdx")
            })
        }.padding(.top, UIScreen.main.bounds.height/20)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true).transition(.opacity)
            .onAppear() {
                UserDefaults.standard.set(true, forKey: "NotificationPermissionPassed")
            }
    }
}

struct RowView: View {
    var id: Int
    var firstPart: String
    var secondPart: String
    @State var tapped: Bool
    var questionId: Int

    var body: some View {
        HStack {
            self.tapped ? Image("checkbox-full") : Image("checkbox-empty")
            Text(firstPart)
                .padding(.leading, 10)
            Text(secondPart)
            Spacer()
        }.contentShape(Rectangle())
        .onTapGesture(perform: {
            tapped.toggle()

            // question 1 updating default values
            if questionId == 1 {
                if self.tapped {
                    if question1SelectedItemsIdxTemp.firstIndex(of: id) != nil {
                        print("contains")
                    } else {
                        question1SelectedItemsIdxTemp.append(id)
                    }
                } else {
                    if let index = question1SelectedItemsIdxTemp.firstIndex(of: id) {
                        question1SelectedItemsIdxTemp.remove(at: index)
                    }
                }
            }

            // question 2 updating default values
            if questionId == 2 {
                if self.tapped {
                    if question2SelectedItemsIdxTemp.firstIndex(of: id) != nil {
                        print("contains")
                    } else {
                        question2SelectedItemsIdxTemp.append(id)
                    }
                } else {
                    if let index = question2SelectedItemsIdxTemp.firstIndex(of: id) {
                        question2SelectedItemsIdxTemp.remove(at: index)
                    }
                }
            }
        })
    }
}

struct Question1View_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}
