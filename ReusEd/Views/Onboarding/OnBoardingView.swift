//
//  OnBoardingView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI





struct OnBoardingView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        NavigationView{
            
            
            switch viewRouter.currentPage {
            case .introductionPages:
                IntroductionPagesView().transition(.opacity)
            case .notificationPermission:
                DailyNotificationsPermissionView().navigationBarHidden(true).transition(.opacity)
            case .personalizationPages:
                Question1View().transition(.opacity)
            case .authorization:
                SignInView().transition(.opacity)
            case .homeTabView:
                HomeView().transition(.opacity)
            }
        }.accentColor(Color(question1.titleColor))
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}



