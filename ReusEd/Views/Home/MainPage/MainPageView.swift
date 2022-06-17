//
//  MainPageView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct MainPageView: View {
    var pageSettings: MainPageData = mainPageData
    @ObservedObject var coursesViewModel = CoursesViewModel(
        courses: courses,
        categories: categories,
        categoryCourses: categoryCourses)
    @State private var searchText: String = ""
    @State private var showCategory: Set<Int> = []
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ProfileHeaderView(image: "Anna",
                                text1: "Hello 👋",
                                text2: "Anna Dluzhinskaya",
                                settings: pageSettings)
                
                SearchBarView(settings: pageSettings,
                              searchText: $searchText)
                
                FilterBarView(showCategory: $showCategory, settings: pageSettings)
                
                ScrollCourseSectionView(settings: pageSettings,
                                        categoriesId: Array(coursesViewModel.categoryCourses.keys).sorted(by: <),
                                        showCategory: $showCategory)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
