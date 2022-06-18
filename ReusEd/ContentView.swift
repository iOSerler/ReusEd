//
//  ContentView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewRouter: ViewRouter
    @State var progress: Int = 1
    var body: some View {

        VStack {
            if viewRouter.currentPage == .homeTabView {
                HomeView().transition(.opacity)
            } else {
                NavigationView {
                    switch viewRouter.currentPage {
                    case .introductionPages:
                        IntroductionPagesView().navigationBarTitleDisplayMode(.large).transition(.opacity.animation(.easeIn))
                    case .notificationPermission:
                        DailyNotificationsPermissionView().navigationBarHidden(true).transition(.opacity.animation(.easeIn))
                    case .personalizationPages:
                        PersonalizationQuestionView(question: questions[0], progress: $progress).transition(.opacity)
                    case .authorization:
                        SignInView().transition(.opacity)
                    case .homeTabView:
                        HomeView().transition(.opacity)
                    }
                }
                .navigationBarHidden(true)
                .accentColor(Color(question1.titleColor))
                
                
                
            }
        }.onAppear {
            viewRouter.setStartingPage()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
