//
//  ScrollCourseSectionView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 17.06.2022.
//

import SwiftUI

struct ScrollCourseSectionView: View {
    var settings: ViewAssets
    var categoriesId: [Int]
    @Binding var showCategory: Set<Int>
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 30) {
                ForEach(categoriesId, id: \.self) {ind in
                    showCategory.count == 0 ?
                    CourseSectionView(settings: settings, categoryId: ind) :
                    (showCategory.contains(ind) ?
                     CourseSectionView(settings: settings, categoryId: ind) : nil)
                    
                }
            }
        }
    }
}
