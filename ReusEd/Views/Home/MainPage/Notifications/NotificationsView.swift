//
//  NotificationsView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct NotificationsView: View {
    @State var courses: [Course] = []
    var settings: ViewAssets
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedSegment) {
                    Text("Notifications").tag(0)
                    Text("News").tag(1)
                    
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                selectedSegment == 0 ? ListView(pageSettings: settings, listType: "notifications") :
                ListView(pageSettings: settings, listType: "news")
            }
        }
    }
}
