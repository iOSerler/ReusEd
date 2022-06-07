//
//  NotificationHandler.swift
//  Internship
//
//  Created by Anna Dluzhinskaya on 06.06.2022.
//

import Foundation
import UserNotifications

class NotificationHandler {
    func askPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
        { success, error in
                if success {
                    print("authorization granted")

                } else if let error = error{
                    print(error.localizedDescription)
                }
            UserDefaults.standard.set(true, forKey: "permissionGranted")
        }
    }
    
    func sendNotification(date: Date, type: String, timeInterval: Double = 10, categoryIdentifier: String, title: String, body: String){
        var trigger : UNNotificationTrigger?
        
        if type == "everyDay"{
            let dateComponente = Calendar.current.dateComponents([.hour, .minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponente, repeats: true)
        }else if type == "time"{
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = categoryIdentifier
        
        let request = UNNotificationRequest(identifier: content.categoryIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
