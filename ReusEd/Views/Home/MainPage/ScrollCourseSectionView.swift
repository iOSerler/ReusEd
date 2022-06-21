//
//  ScrollCourseSectionView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 17.06.2022.
//

import SwiftUI

struct ScrollCourseSectionView: View {
    var settings: ViewAssets
    var categories: [Category]
    @ObservedObject var coursesViewModel: CoursesViewModel
    @Binding var showCategory: Set<Int>
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                ForEach(categories) { category in
                    showCategory.count == 0 ?
                    CourseSectionView(settings: settings, category: category, coursesViewModel: coursesViewModel) :
                    (showCategory.contains(category.id!) ?
                     CourseSectionView(settings: settings, category: category, coursesViewModel: coursesViewModel) : nil)
                    
                }
            }
        }
    }
}
