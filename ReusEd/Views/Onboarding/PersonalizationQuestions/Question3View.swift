//
//  Question3View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct Question3View: View {
    @State private var selectedIndex: Int = question3SelectedItemIdx
    var body: some View {

        VStack(alignment: .center) {
            Image(question3.stepsImage)
                .onAppear() {
                    if let temp =  UserDefaults.standard.value(forKey: "question3SelectedIdx") {
                        self.selectedIndex = (temp as? Int) ?? 0
                    }
                }

            Text(question3.title)
                .font(Font.custom(question3.titleFont, size: 20))
                .foregroundColor(Color(question3.titleColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)

            Text(question3.description)
                .font(Font.custom(question3.descriptionFont, size: 14))
                .foregroundColor(Color(question3.descriptionColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
                .padding(.horizontal)

            Button(
                action: {
                    if self.selectedIndex == 1 {
                        self.selectedIndex = 0
                    } else {
                        self.selectedIndex = 1
                    }
                },
                label: {
                    HStack {
                        Text(question3.optionsData[0].firstPart)
                            .font(.custom(question3.titleFont, size: 16))
                            .foregroundColor(self.selectedIndex == 1 ? Color(question3.buttonColor) : .black)
                            .padding(.leading, 20)
                        Spacer()
                        Text(question3.optionsData[0].secondPart)
                            .font(.custom(question3.descriptionFont, size: 14))
                            .foregroundColor(
                                self.selectedIndex == 1 ?
                                Color(question3.optionsColor) : Color(question3.descriptionColor)
                            )
                            .padding(.trailing, 20)
                    }

                    .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(self.selectedIndex == 1 ? Color(question3.buttonColor) : Color("border"), lineWidth: 2))
                    .background(self.selectedIndex == 1 ? Color("background2") : .white)

                }
            )
            .cornerRadius(12)
            .padding(.top, 30)

            Button(
                action: {
                    if self.selectedIndex == 2 {
                        self.selectedIndex = 0
                    } else {
                        self.selectedIndex = 2
                    }
                }, label: {
                    HStack {
                        Text(question3.optionsData[1].firstPart)
                            .font(.custom(question3.titleFont, size: 16))
                            .foregroundColor(self.selectedIndex == 2 ? Color(question3.buttonColor) : .black)
                            .padding(.leading, 20)
                        Spacer()
                        Text(question3.optionsData[1].secondPart)
                            .font(.custom(question3.descriptionFont, size: 14))
                            .foregroundColor(
                                self.selectedIndex == 2 ?
                                Color(question3.optionsColor) : Color(question3.descriptionColor)
                            )
                            .padding(.trailing, 20)
                    }
                    .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(self.selectedIndex == 2 ? Color(question3.buttonColor) : Color("border"), lineWidth: 2))
                    .background(self.selectedIndex == 2 ? Color("background2") : .white)
                }
            )
            .cornerRadius(12)
            .padding(.top, 10)

            Button(
                action: {
                    if self.selectedIndex == 3 {
                        self.selectedIndex = 0
                    } else {
                        self.selectedIndex = 3
                    }
                }, label: {
                    HStack {
                        Text(question3.optionsData[2].firstPart)
                            .font(.custom(question3.titleFont, size: 16))
                            .foregroundColor(self.selectedIndex == 3 ? Color(question3.buttonColor) : .black)
                            .padding(.leading, 20)
                        Spacer()
                        Text(question3.optionsData[2].secondPart)
                            .font(.custom(question3.descriptionFont, size: 14))
                            .foregroundColor(
                                self.selectedIndex == 3 ?
                                Color(question3.optionsColor) : Color(question3.descriptionColor)
                            )
                            .padding(.trailing, 20)
                    }
                    .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(self.selectedIndex == 3 ? Color(question3.buttonColor) : Color("border"), lineWidth: 2))
                    .background(self.selectedIndex == 3 ? Color("background2") : .white)
                }
            )
            .cornerRadius(12)
            .padding(.top, 10)

            Button(
                action: {
                    if self.selectedIndex == 4 {
                        self.selectedIndex = 0
                    } else {
                        self.selectedIndex = 4
                    }
                },
                label: {
                    HStack {
                        Text(question3.optionsData[3].firstPart)
                            .font(.custom(question3.titleFont, size: 16))
                            .foregroundColor(self.selectedIndex == 4 ? Color(question3.buttonColor) : .black)
                            .padding(.leading, 20)
                        Spacer()
                        Text(question3.optionsData[3].secondPart)
                            .font(.custom(question3.descriptionFont, size: 14))
                            .foregroundColor(
                                self.selectedIndex == 4 ?
                                Color(question3.optionsColor) : Color(question3.descriptionColor)
                            )
                            .padding(.trailing, 20)
                    }
                    .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(self.selectedIndex == 4 ? Color(question3.buttonColor) : Color("border"), lineWidth: 2))
                    .background(self.selectedIndex == 4 ? Color("background2") : .white)
                }
            )
            .cornerRadius(12)
            .padding(.top, 10)

            //            CustomButton(selected: true, text1: "Casual", text2: "5 min / day", id: 1)
            //            CustomButton(text1: "Regular", text2: "10 min / day", id: 2)
            //            CustomButton(text1: "Serious", text2: "15 min / day", id: 3)
            //            CustomButton(text1: "Intense", text2: "20 min / day", id: 4)

            Spacer()

            NavigationLink(destination: Question4View()) {
                Text("Continue")
                    .font(Font.custom(question3.titleFont, size: 16))
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .foregroundColor(Color(question2.buttonTextColor))
                    .background(Color(question2.buttonColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/30)
            }.simultaneousGesture(TapGesture().onEnded {
                question3SelectedItemIdx = selectedIndex
                UserDefaults.standard.set(selectedIndex, forKey: "question3SelectedIdx")
            })
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Question3View_Previews: PreviewProvider {
    static var previews: some View {
        Question3View()
    }
}

//
// struct CustomButton: View {
//    @State  var selected: Bool = false
//
//    var text1: String
//    var text2: String
//    var id: Int
//
//    var body: some View {
//        Button(action: {
//            print(text1)
//            if question3SelectedItemIdxTemp == self.id {
//                question3SelectedItemIdxTemp = 0
//                self.selected = false
//            } else {
//                question3SelectedItemIdxTemp = self.id
//                self.selected = true
//            }
//        }) {
//            HStack {
//                Text(text1)
//                    .font(.custom("Rubik-Medium", size: 16))
//                    .foregroundColor(self.selected ? Color("Primary") : .black)
//                    .padding(.leading, 20)
//                Spacer()
//                Text(text2)
//                    .font(.custom("Rubik-Regular", size: 14))
//                    .foregroundColor(self.selected ? Color("MainText") : Color("Gray"))
//                    .padding(.trailing, 20)
//
//            }
//
//                .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
//                .overlay(RoundedRectangle(cornerRadius: 12)
//                    .stroke(self.selected ? Color("Primary") : Color("border"), lineWidth: 2))
//                .background(self.selected ? Color("background2") : .white)
//
//
//        }
//        .cornerRadius(12)
//            .padding(.top, 30)
//    }
// }

// struct CustomButtonContentStyle: View {
//    @State  var selected: Bool = false
//
//    var text1: String
//    var text2: String
//    var id: Int
//
//    var body: some View {
//
//            HStack {
//                Text(text1)
//                    .font(.custom("Rubik-Medium", size: 16))
//                    .foregroundColor(self.selected ? Color("Primary") : .black)
//                    .padding(.leading, 20)
//                Spacer()
//                Text(text2)
//                    .font(.custom("Rubik-Regular", size: 14))
//                    .foregroundColor(self.selected ? Color("MainText") : Color("Gray"))
//                    .padding(.trailing, 20)
//
//            }
//
//                .frame(width: UIScreen.main.bounds.width - 60, height: 66, alignment: .leading)
//                .overlay(RoundedRectangle(cornerRadius: 12)
//                    .stroke(self.selected ? Color("Primary") : Color("border"), lineWidth: 2))
//                .background(self.selected ? Color("background2") : .white)
//
//    }
// }
