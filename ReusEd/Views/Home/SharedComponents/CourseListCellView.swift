//
//  CourseListCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct CourseListCellView: View {
    @State var course: Course
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Image(course.posterSmall)
                VStack(alignment: .leading) {
                    Text(course.title)
                        .font(.custom(mainPageData.titleFont, size: 14))
                        .foregroundColor(.black)
                    Text(course.description)
                        .font(.custom(mainPageData.descriptionFont, size: 12))
                        .foregroundColor(Color(mainPageData.descriptionColor))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)

                    Spacer()
                    HStack(alignment: .center, spacing: 1) {
                        Image(mainPageData.timeImage)
                        Text(course.duration)
                            .font(.custom(mainPageData.descriptionFont, size: 12))
                            .foregroundColor(Color(mainPageData.additionalTextColor))
                            .padding(.leading, 5)
                        Spacer()
                        ProgressView(value: course.progress * 100, total: 100)
                            .scaleEffect(1.5, anchor: .center)
                            .accentColor(Color(mainPageData.additionalTextColor))
                            .frame(width: UIScreen.main.bounds.width / 5)
                            .padding(.trailing, 30)
                        Text("\(Int((course.progress * 100).rounded())) %")
                            .font(.custom(mainPageData.descriptionFont, size: 12))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 1)
                    
                }
                .frame(height: 80)
                .padding(.leading, 10)
                
            }
            .padding(.horizontal, 20)
            .frame(height: 100)
            
        }
    }
}

struct CourseListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListCellView(course: courses[0])
    }
}
