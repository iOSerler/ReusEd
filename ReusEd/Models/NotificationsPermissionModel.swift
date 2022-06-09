//
//  NotificationsPermission.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.


import Foundation

struct NotificationPermission {
    var logoImage: String
    var title: String
    var titleFont: String
    var description: String
    var descriptionFont: String
    var alertImage: String
    var arrowImage: String
    var buttonColor: String
    var titleColor: String
    var descriptionColor: String
    var buttonTextColor: String
}

var notificationPermissionData = NotificationPermission(logoImage: "bookLogo", title: "Get daily reminders to meet your personal goals.", titleFont: "Rubik-Medium", description: "You’ll get daily reminders about your courses and new daily deals from our shop.",descriptionFont: "Rubik-Regular", alertImage: "NotificationFrame", arrowImage: "up-arrow", buttonColor: "Primary", titleColor: "MainText", descriptionColor: "Gray", buttonTextColor: "White")

