//
//  Question1View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct PersonalizationQuestionView: View {
    var settings: ViewAssets
    @EnvironmentObject var viewRouter: ViewRouter
    
    let question: QuestionData
    @Binding var progress: Int
    
    var body: some View {
        
        VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15) {
            CustomProgressBarView(settings: settings,
                                  numQuestions: questions.count,
                                  progress: $progress)
            
            if !question.image.isEmpty {
                Image(question.image)
                    .padding(.top, UIScreen.main.bounds.height / 10)
            }
            
            Text(question.title)
                .font(Font.custom(settings.titleFont, size: 20))
                .foregroundColor(Color(settings.mainTextColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
            
            Text(question.description)
                .font(Font.custom(settings.descriptionFont, size: 14))
                .foregroundColor(Color(settings.descriptionTextColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
                .padding(.horizontal)
            
            if question.type == "checkbox" {
                CheckboxList(question: question)
            } else if question.type == "singleChoice" {
                RadioButtonList(settings: settings, question: question)
            }
            Spacer()
            
            if question.id < 4 {
                
                NavigationLink(destination: PersonalizationQuestionView(settings: viewAssets, question: questions[question.id], progress: $progress)) {
                    Text("Continue")
                        .font(Font.custom(settings.titleFont, size: 16))
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .foregroundColor(Color(settings.buttonTextColor))
                        .background(Color(settings.primaryColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }.simultaneousGesture(TapGesture().onEnded {
                    
                    guard let selectedItems = personalizationQuestionSelectedItemsDict[question.id] else {
                        return
                    }
                    
                    UserDefaults.standard.set(Array(selectedItems), forKey: "checkBoxQuestionID_\(question.id)")
                })
                
            } else {
                Button(action: {
                    self.saveAnswerData()
                    
                    DispatchQueue.main.async {
                        withAnimation {
                            viewRouter.completePersonalization()
                        }
                    }
                }, label: {
                    Text("Done")
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .font(Font.custom(settings.titleFont, size: 16))
                        .background(Color(settings.primaryColor))
                        .accentColor(Color(settings.buttonTextColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                })
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(false).transition(.opacity)
        .onAppear {
            self.progress = question.id
        }
    }
    
    func saveAnswerData() {
        
        for ind in personalizationQuestionSelectedItemsDict.keys {
            if let answers  = UserDefaults.standard.value(forKey: "checkBoxQuestionID_\(ind)") as? [Int] {
                
                for answer in answers {
                    print(ind, answer)
                }
            }
            
        }
        
    }
}
