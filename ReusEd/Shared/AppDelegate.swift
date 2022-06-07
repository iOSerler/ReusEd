
//  InternshipApp.swift
//  Internship
//
//  Created by Anna Dluzhinskaya on 06.06.2022.
//

import SwiftUI
import Foundation
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    //add the ability to receive notifications while the application is running
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.banner, .sound])
    }
    
    //allows you to do some action when entering the application by clicking on the notification
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    didReceive response: UNNotificationResponse,
                                    withCompletionHandler completionHandler: @escaping () -> Void) {
        
            let info = response.notification.request.content.categoryIdentifier
            print(info)

            completionHandler()
    }
    
}
