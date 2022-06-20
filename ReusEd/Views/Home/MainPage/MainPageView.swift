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
    @State private var showCategory: Set<Int> = []
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ProfileHeaderView(image: "Anna",
                                  text1: "Hello 👋",
                                  text2: "Anna Dluzhinskaya",
                                  settings: settings)
                
                FilterBarView(showCategory: $showCategory,
                              settings: settings,
                              filterButtonImage: icons.filterButtonImage)
                
                ScrollCourseSectionView(settings: settings,
                                        categoriesId: Array(coursesViewModel.categoryCourses.keys).sorted(by: <),
                                        showCategory: $showCategory)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .padding(.top, 7)
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(settings: viewAssets,
                     coursesViewModel: CoursesViewModel(
                        courses: courses,
                        categories: categories,
                        categoryCourses: categoryCourses))
    }
}
