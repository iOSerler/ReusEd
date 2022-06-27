//
//  FilterBarView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import SwiftUI

struct FilterBarView: View {
    
    @ObservedObject var coursesViewModel: CoursesViewModel
    @State private var showingSheet: Bool = false
    @State private var applyFilter: Bool = false
    
    @Binding var showCategory: Set<Int>
    var settings: ViewAssets
    var filterButtonImage: String
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 15) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(coursesViewModel.categories) {category in
                        FilterButtonView(id: category.id,
                                         title: category.title,
                                         titleFont: settings.descriptionFont,
                                         titleColor: settings.descriptionTextColor,
                                         pressColor: settings.primaryLighterColor,
                                         showCategory: $showCategory)
                    }
                }.frame(height: 50)
                    .padding(.horizontal, 5)
            }
        }.padding(.leading, 10)
        
    }
}
