//
//  ContentView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter = ViewRouter()
    var isAppBeingTested = false
    var body: some View {

        VStack {
            OnBoardingView().environmentObject(viewRouter)
        }.onAppear {

            // Here we are identifying the initial entry point for the main navigation view

            if isAppBeingTested {
                viewRouter.currentPage = .introductionPages
            } else {

                let introductionPagesPassed = UserDefaults.standard.bool(forKey: "IntroductionPagesPassed")

                guard introductionPagesPassed else {
                    viewRouter.currentPage = .introductionPages
                    return
                }

                let notificationPermissionPassed =
                UserDefaults.standard.bool(forKey: "NotificationPermissionPassed")

                guard notificationPermissionPassed else {
                    viewRouter.currentPage = .notificationPermission
                    return
                }

                let personalizationPassed = UserDefaults.standard.bool(forKey: "PersonalizationPassed")

                guard personalizationPassed else {
                    viewRouter.currentPage = .personalizationPages
                    return
                }

                /// FIXME: should check authorization with authorization service, not in user defaults
                let userToken = UserDefaults.standard.value(forKey: "userToken")

                guard userToken != nil else {
                    viewRouter.currentPage = .authorization
                    return
                }

                viewRouter.showIntroduction()

            }

        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
