//
//  ContentView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI
import PersonalizationKit

struct ContentView: View {
    var settings: ViewAssets
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        
        VStack {
            if viewRouter.currentPage == .homeTabView {
                HomeView(settings: viewAssets, tabBarSettings: tabBar).transition(.opacity)
            } else {
                NavigationView {
                    switch viewRouter.currentPage {
                    case .introductionPages:
                        IntroductionPagesView(settings: viewAssets).navigationBarTitleDisplayMode(.large).transition(.opacity.animation(.easeIn))
                    case .notificationPermission:
                        DailyNotificationsPermissionView(settings: viewAssets).navigationBarHidden(true).transition(.opacity.animation(.easeIn))
                    case .personalizationPages:
                        PersonalizationQuestionView(
                            assets: viewAssets,
                            completePersonalization: viewRouter.completePersonalization,
                            questions: questions,
                            storage: Storage(),
                            question: questions[0]
                        ).transition(.opacity)
                    case .authorization:
                        AuthorizationView {
                            viewRouter.completeAuthorization(with: $0)
                        }
                        .navigationBarHidden(true)
                        .transition(.opacity)
                    case .homeTabView:
                        HomeView(settings: viewAssets, tabBarSettings: tabBar).transition(.opacity)
                    }
                }
                .navigationBarHidden(true)
                .accentColor(Color(settings.mainTextColor))
                
                
                
            }
        }.onAppear {
            viewRouter.setStartingPage()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(settings: viewAssets)
    }
}

struct Storage: PersonalizationStorage {
    func addCheckedOption(_ question: QuestionData, option: OptionData) {
        
        let storageID = "checkBoxQuestionID_\(question.id)"
        let checkedOptions = UserDefaults.standard.mutableSetValue(forKey: storageID)
        checkedOptions.add(option.id)
        UserDefaults.standard.set(checkedOptions, forKey: storageID)
                
    }

    func removeCheckedOption(_ question: QuestionData, option: OptionData) {
        let storageID = "checkBoxQuestionID_\(question.id)"
        let checkedOptions = UserDefaults.standard.mutableSetValue(forKey: storageID)
        checkedOptions.remove(option.id)
        UserDefaults.standard.set(checkedOptions, forKey: storageID)
    }
    
    func isOptionChecked(_ question: QuestionData, option: OptionData) -> Bool {
        let storageID = "checkBoxQuestionID_\(question.id)"
        let checkedOptions = UserDefaults.standard.mutableSetValue(forKey: storageID)
        let isOptionChecked = checkedOptions.contains(option.id)
        
        return isOptionChecked
    }
    
    func getChosenOption(_ question: QuestionData) -> Int {
        let storageID = "checkBoxQuestionID_\(question.id)"
        let chosenOption = UserDefaults.standard.integer(forKey: storageID)
        return chosenOption
    }
    
    func setChosenOption(_ question: QuestionData, option: OptionData) {
        let storageID = "checkBoxQuestionID_\(question.id)"
        UserDefaults.standard.set(option.id, forKey: storageID)
    }
}
