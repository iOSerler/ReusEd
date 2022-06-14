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
            if viewRouter.currentPage == .homeTabView {
                HomeView().transition(.opacity)
            } else {
                NavigationView {
                    switch viewRouter.currentPage {
                    case .introductionPages:
                        IntroductionPagesView().transition(.opacity)
                    case .notificationPermission:
                        DailyNotificationsPermissionView().navigationBarHidden(true).transition(.opacity)
                    case .personalizationPages:
                        PersonalizationQuestionView(question: questions.removeFirst()).transition(.opacity)
                    case .authorization:
                        // TODO: Fix viewRouter Authorization
                        AuthorizationView() { result in
                            viewRouter.completeAuthorization(
                                with: result.token,
                                and: result.type.rawValue
                            )
                        }
                        .navigationBarHidden(true)
                        .transition(.opacity)
                    case .homeTabView:
                        HomeView().transition(.opacity)
                    }
                }.accentColor(Color(question1.titleColor))
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
