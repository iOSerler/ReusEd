//
//  Helpers.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import Foundation
import SwiftUI

enum ViewRouterOptions {
    case introductionPages
    case notificationPermission
    case personalizationPages
    case authorization
    case homeTabView
}

class ViewRouter: ObservableObject {

    @Published var currentPage: ViewRouterOptions = .introductionPages
    private var isAppBeingTested = false

    func setStartingPage() {
        if isAppBeingTested {
            showIntroduction()
        } else {

            let introductionPagesPassed = UserDefaults.standard.bool(forKey: "IntroductionPagesPassed")

            guard introductionPagesPassed else {
                showIntroduction()
                return
            }

            let notificationPermissionPassed =
            UserDefaults.standard.bool(forKey: "NotificationPermissionPassed")

            guard notificationPermissionPassed else {
                showNotificationPermission()
                return
            }

            /// FIXME: should check authorization with authorization service, not in user defaults
            let userToken = UserDefaults.standard.value(forKey: "userToken")

            guard userToken != nil else {
                showAuthorization()
                return
            }

            let personalizationPassed = UserDefaults.standard.bool(forKey: "PersonalizationPassed")

            guard personalizationPassed else {
                showPersonalization()
                return
            }

            showHomeTab()

        }

    }

    func showIntroduction() {
        currentPage = .introductionPages
    }

    func completeIntroduction() {
        UserDefaults.standard.set(true, forKey: "IntroductionPagesPassed")
        showNotificationPermission()
    }

    func showNotificationPermission() {
        currentPage = .notificationPermission
    }

    func completeNotificationPermission() {
        UserDefaults.standard.set(true, forKey: "NotificationPermissionPassed")
        showAuthorization()

    }

    func showPersonalization() {
        for ind in personalizationQuestionSelectedItemsDict.keys {
            if let answers  = UserDefaults.standard.value(forKey: "checkBoxQuestionID_\(ind)") as? [Int] {

                for answer in answers {
//                    print(ind, answer)
                    personalizationQuestionSelectedItemsDict[ind]?.insert(answer)
                }
            }

        }
        currentPage = .personalizationPages
    }

    func completePersonalization() {
        UserDefaults.standard.set(true, forKey: "PersonalizationPassed")
        showHomeTab()
    }

    func showAuthorization() {
        currentPage = .authorization
    }

    func completeAuthorization(with result: AuthorizationResult) {
        UserDefaults.standard.set("test", forKey: "userToken")
        result.type == .signUp ? showPersonalization() : showHomeTab()
    }

    func showHomeTab() {
        currentPage = .homeTabView
    }

}
