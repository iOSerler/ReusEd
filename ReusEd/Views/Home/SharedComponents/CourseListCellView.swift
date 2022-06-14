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
            HStack(alignment: .top) {
                Image(course.posterSmall)
                VStack(alignment: .leading) {
                    Text(course.title)
                        .font(.custom("Rubik-Medium", size: 14))
                        .foregroundColor(.black)
                    Text(course.description)
                        .font(.custom("Rubik-Regular", size: 12))
                        .foregroundColor(Color("Gray"))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 0.1)

                    Spacer()
                    HStack(alignment: .center, spacing: 1) {
                        Image("timer")
                        Text(course.duration)
                            .font(.custom("Rubik-Regular", size: 12))
                            .foregroundColor(Color("Primary"))
                        Spacer()
                        ProgressView(value: course.progress)
                            .scaleEffect(1.5, anchor: .center)
                            .accentColor(Color("Primary"))
                            .frame(width: UIScreen.main.bounds.width / 5)
                            .padding(.trailing, 30)
                        Text("50 %")
                            .font(.custom("Rubik-Medium", size: 12))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 1)
                    
                }
                
            }
            .padding(.horizontal, 20)
            .frame(height: 80)
            Spacer()
        }
    }
}

struct CourseListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListCellView(course: courses[0])
    }
}
