//
//  FilterBarView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import SwiftUI

struct FilterBarView: View {
    
    @ObservedObject var coursesViewModel = CoursesViewModel(
        courses: courses,
        categories: categories,
        categoryCourses: categoryCourses)
    @State private var showingSheet: Bool = false
    @State private var applyFilter: Bool = false
    
    @Binding var showCategory: Set<Int>
    var settings: MainPageData
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 15) {
            Button(
                action: {
                    self.showingSheet.toggle()
                    
                },
                label: {
                    VStack {
                        Image(settings.filterButtonImage)
                            .padding(.all, 10)
                            .background(applyFilter ? Color(settings.filterButtonColor) : Color.white)
                        
                    }.cornerRadius(UIScreen.main.bounds.width/40)
                     .overlay(
                        RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/40)
                            .stroke(.gray, lineWidth: 0.4)
                    )
                }).sheet(isPresented: $showingSheet) {
                    FilterView(applyFilter: $applyFilter)
                  }
        
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(coursesViewModel.categories) {category in
                        FilterButtonView(id: category.id,
                                         title: category.filterTitle!,
                                         titleFont: settings.descriptionFont,
                                         titleColor: settings.descriptionColor,
                                         pressColor: settings.filterButtonColor,
                                         showCategory: $showCategory)
                    }
                }.frame(height: 50)
                 .padding(.horizontal, 5)
            }
        }.padding(.leading, 20)
        
    }
}