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

    func showIntroduction() {
        currentPage = .homeTabView
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
        showPersonalization()
    }

    func showPersonalization() {
        currentPage = .personalizationPages
    }

    func completePersonalization() {
        UserDefaults.standard.set(true, forKey: "PersonalizationPassed")
        showAuthorization()
    }

    func showAuthorization() {
        currentPage = .authorization
    }

    func completeAuthorization(with token: String) {
        UserDefaults.standard.set(token, forKey: "userToken")
        showHomeTab()
    }

    func showHomeTab() {
        currentPage = .homeTabView
    }

}
