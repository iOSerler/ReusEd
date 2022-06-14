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
    var body: some View {
        VStack(spacing: 5) {
            SearchBarView(settings: pageSettings,
                          searchText: $searchText)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(Array(coursesViewModel.categoryCourses.keys).sorted(by: <), id: \.self) {key in
                        CourseSectionView(settings: pageSettings, categoryId: key)
                    }
                }
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
