//
//  MainPageView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct MainPageView: View {
    var settings: ViewAssets
    @ObservedObject var coursesViewModel: CoursesViewModel
    @ObservedObject var notificationViewModel: NotificationViewModel
    @State private var showCategory: Set<Int> = []
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ProfileHeaderView(image: "Anna",
                                  text1: "Hello 👋",
                                  text2: "Anna Dluzhinskaya",
                                  settings: settings,
                                  coursesViewModel: coursesViewModel,
                                  notificationViewModel: notificationViewModel
                )
                
                FilterBarView(coursesViewModel: coursesViewModel,
                              showCategory: $showCategory,
                              settings: settings,
                              filterButtonImage: viewAssets.filterButtonImage)
                
                ScrollCourseSectionView(settings: settings,
                                        coursesViewModel: coursesViewModel,
                                        showCategory: $showCategory)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .padding(.top, 7)
        }
    }
}
