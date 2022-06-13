//
//  ReusEdApp.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

@main
struct ReusEdApp: App {
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewRouter())
        }
    }
}
