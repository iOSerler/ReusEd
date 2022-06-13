//
//  ContentView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {

        VStack {
            NavigationView {
                switch viewRouter.currentPage {
                case .introductionPages:
                    IntroductionPagesView().transition(.opacity)
                case .notificationPermission:
                    DailyNotificationsPermissionView().navigationBarHidden(true).transition(.opacity)
                case .personalizationPages:
                    PersonalizationQuestionView(question: questions.removeFirst()).transition(.opacity)
                case .authorization:
                    SignInView().transition(.opacity)
                case .homeTabView:
                    HomeView().transition(.opacity)
                }
            }.accentColor(Color(question1.titleColor))
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
