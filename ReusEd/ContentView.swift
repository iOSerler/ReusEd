//
//  ContentView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI
import PersonalizationKit
import OnBoardingKit

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
//                        IntroductionPagesView(settings: viewAssets).navigationBarTitleDisplayMode(.large).transition(.opacity.animation(.easeIn))
                        IntroductionPagesView(settings: settings, completeAction: {
                            viewRouter.completeIntroduction()
                        }, navigateAction: {
                            viewRouter.showNotificationPermission()
                        }, jsonName: "onBoardingPages")
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
