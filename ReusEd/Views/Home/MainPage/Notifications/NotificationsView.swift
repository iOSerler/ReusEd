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
    @ObservedObject var coursesViewModel: CoursesViewModel = CoursesViewModel()
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
                
                ListView(pageSettings: settings,
                         listType: {
                            switch selectedSegment {
                            case 0:
                                return "notifications"
                            case 1:
                                return "news"
                            default:
                                return ""
                            }
                }())
            }
        }
    }
}
