//
//  NotificationsPermission.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
// REDO LATER

import Foundation
import UIKit

struct NotificationPermission {
    var logoImage: String
    var title: String
    var description: String
    var alertImage: String
    var arrowImage: String
    var buttonColor: String
    var titleColor: String
    var descriptionColor: String
}

var notificationPermissionData = NotificationPermission(logoImage: "bookLogo", title: "Get daily reminders to meet your personal goals.", description: "You’ll get daily reminders about your courses and new daily deals from our shop.", alertImage: "NotificationFrame", arrowImage: "up-arrow", buttonColor: "Primary", titleColor: "MainText", descriptionColor: "Gray")

