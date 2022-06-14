//
//  CourseCardView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct CourseCardView: View {
    
    var course: Course
    var settings: MainPageData
    var body: some View {
        NavigationLink(destination: CourseDetailView(courseId: course.id)) {
            VStack(alignment: .leading, spacing: UIScreen.main.bounds.height/65) {
                Image(course.posterBig)
                    .resizable()
                
                VStack(alignment: .leading, spacing: UIScreen.main.bounds.height/65) {
                    Text(course.title)
                        .font(Font.custom(settings.titleFont, size: 14))
                        .foregroundColor(Color(settings.titleColor))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 7)
                    
                    Text(course.description)
                        .font(Font.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.descriptionColor))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 7)
                    
                    HStack {
                        Image(settings.timeImage)
                        Text(course.duration)
                            .font(Font.custom(settings.descriptionFont, size: 12))
                            .foregroundColor(Color(settings.additionalTextColor))
                            .padding(.leading, 5)
                        
                    }.padding([.leading, .bottom], 7)
                }.frame(width: UIScreen.main.bounds.width/2.5, alignment: .leading)
                
            }.frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/4)
                .cornerRadius(UIScreen.main.bounds.width/30)
                .overlay(
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/30)
                        .stroke(Color(settings.descriptionColor), lineWidth: 0.4)
                )
        }
        
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
