//
//  NotificationHandler.swift
//  Internship
//
//  Created by Anna Dluzhinskaya on 06.06.2022.
//

import Foundation
import UserNotifications
import SwiftUI
class NotificationHandler {
    func askPermission(viewRouter: ViewRouter) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("authorization granted")
                DispatchQueue.main.async {
                    withAnimation {
                        viewRouter.completeNotificationPermission()
                    }
                }

            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func sendNotification(
        date: Date,
        repeats: Bool,
        type: String,
        timeInterval: Double = 10,
        content: UNMutableNotificationContent
    ) {
        var trigger: UNNotificationTrigger?

        if type == "date"{
            let dateComponente = Calendar.current.dateComponents([.hour, .minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponente, repeats: repeats)
        } else if type == "time"{
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
        }

        content.sound = UNNotificationSound.default

        let request = UNNotificationRequest(identifier: content.categoryIdentifier, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
