//
//  ContentView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    var settings: ViewAssets
    @EnvironmentObject var viewRouter: ViewRouter
    @State var progress: Int = 1
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
                        PersonalizationQuestionView(settings: viewAssets, question: questions[0], progress: $progress).transition(.opacity)
                    case .authorization:
                        SignInView(settings: viewAssets).transition(.opacity)
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
