//
//  CourseSectionView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct CourseSectionView: View {
    var sectionTitle: String = "Design"
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            HStack {
                Text(sectionTitle)
                    .font(Font.custom("Rubik-Medium", size: 16))
                    .foregroundColor(Color("MainText"))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.leading, 10)
                Spacer()
                Text("View All")
                    .font(Font.custom("Rubik-Regular", size: 14))
                    .foregroundColor(Color("MainText"))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing, 10)
                
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<10) {_ in
                        CourseCardView()
                    }
                }
            }
            
        }.frame(width: UIScreen.main.bounds.width - 20)
    }
}

struct CourseSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CourseSectionView()
    }
}
