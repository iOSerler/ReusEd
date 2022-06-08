//
//  OnBoardingView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI





struct OnBoardingView: View {
    let backgroundColor = Color(#colorLiteral(red: 0.2705882353, green: 0.3019607843, blue: 0.3568627451, alpha: 1))
    let primaryMain = Color(#colorLiteral(red: 0.3803921569, green: 0.2745098039, blue: 0.7764705882, alpha: 1))
    @EnvironmentObject var viewRouter: ViewRouter
    @State var isPresented =  UserDefaults.standard.bool(forKey: "OnBoardingPresented")
    @State var isPermissionGranted =  UserDefaults.standard.bool(forKey: "permissionGranted")
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
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}



