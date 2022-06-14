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
        NavigationView {
            VStack(spacing: 20) {
                ProfileHeaderView(image: "Anna",
                                  text1: "Hello 👋",
                                  text2: "Anna Dluzhinskaya",
                                  settings: pageSettings)
                
                SearchBarView(settings: pageSettings,
                              searchText: $searchText)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        FilterButtonView(type: "image",
                                         titleOrImageName: "filter")
                        
                        FilterButtonView(type: "text",
                                         titleOrImageName: "🔥 All",
                                         titleFont: pageSettings.descriptionFont,
                                         titleColor: pageSettings.descriptionColor)
                        
                        FilterButtonView(type: "text",
                                         titleOrImageName: "🎨 Design",
                                         titleFont: pageSettings.descriptionFont,
                                         titleColor: pageSettings.descriptionColor)
                        
                        FilterButtonView(type: "text",
                                         titleOrImageName: "⌨️ Programming",
                                         titleFont: pageSettings.descriptionFont,
                                         titleColor: pageSettings.descriptionColor)
                    }.padding(.leading, 20)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 30) {
                        ForEach(Array(coursesViewModel.categoryCourses.keys).sorted(by: <), id: \.self) {key in
                            CourseSectionView(settings: pageSettings, categoryId: key)
                        }
                    }
                }
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
