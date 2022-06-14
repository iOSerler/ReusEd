//
//  MainPageView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct MainPageView: View {
    var pageSettings: MainPageData
    @State private var searchText: String = ""
    var body: some View {
        VStack(spacing: 20) {
            SearchBarView(font: pageSettings.descriptionFont,
                          placeholderColor: pageSettings.descriptionColor,
                          cancelButtonColor: pageSettings.additionalTextColor,
                          searchText: $searchText)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(0..<10) {_ in
                        CourseSectionView()
                    }
                }
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(pageSettings: mainPageData)
    }
}
