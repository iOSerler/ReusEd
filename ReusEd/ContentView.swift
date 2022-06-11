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

                let personalizationPassed = UserDefaults.standard.bool(forKey: "OnBoardingPassed")

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

                viewRouter.currentPage = .homeTabView

            }

            // Here Default / saved values for personalization questions are specified

            if viewRouter.currentPage == .personalizationPages || viewRouter.currentPage == .introductionPages ||
                viewRouter.currentPage == .notificationPermission {

                // question 1 default values
                question1SelectedItemsBool = [Bool]()
                for _ in 0...question1.optionsData.count - 1 {
                    question1SelectedItemsBool.append(false)
                }
                if let temp =  UserDefaults.standard.value(forKey: "question1SelectedIdx") {
                    question1SelectedItemsIdx = (temp as? [Int]) ?? []
                    question1SelectedItemsIdxTemp = question1SelectedItemsIdx

                    for item in question1SelectedItemsIdx {
                        question1SelectedItemsBool[item] = true
                    }
                }

                // question 2 default values
                question2SelectedItemsBool = [Bool]()
                for _ in 0...question2.optionsData.count - 1 {
                    question2SelectedItemsBool.append(false)
                }
                if let temp =  UserDefaults.standard.value(forKey: "question2SelectedIdx") {
                    question2SelectedItemsIdx = (temp as? [Int]) ?? []
                    question2SelectedItemsIdxTemp = question2SelectedItemsIdx

                    for item in question2SelectedItemsIdx {
                        question2SelectedItemsBool[item] = true
                    }
                }

                // question 3 default value
                if let temp =  UserDefaults.standard.value(forKey: "question3SelectedIdx") {
                    question3SelectedItemIdx = (temp as? Int) ?? 0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
