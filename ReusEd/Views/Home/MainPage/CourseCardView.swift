//
//  CourseCardView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct CourseCardView: View {
    
    var course: Course
    var settings: ViewAssets
    var timeImage: String
    var body: some View {
        NavigationLink(
            destination: CourseDetailView(courseId: course.id, settings: settings, isText: false, detail: course.detail)
        ) {
            VStack(alignment: .leading, spacing: UIScreen.main.bounds.height/65) {
                Image(course.posterBig)
                    .resizable()
                
                VStack(alignment: .leading, spacing: UIScreen.main.bounds.height/65) {
                    Text(course.title)
                        .font(Font.custom(settings.titleFont, size: 14))
                        .foregroundColor(Color(settings.mainTextColor))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 7)
                    
                    Text(course.description)
                        .font(Font.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.descriptionTextColor))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 7)
                    
                    HStack {
                        Image(timeImage)
                        Text(course.duration)
                            .font(Font.custom(settings.descriptionFont, size: 12))
                            .foregroundColor(Color(settings.primaryLightColor))
                            .padding(.leading, 5)
                        
                    }.padding([.leading, .bottom], 7)
                }.frame(width: UIScreen.main.bounds.width/2.5, alignment: .leading)
                
            }.frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/4)
                .cornerRadius(UIScreen.main.bounds.width/30)
                .overlay(
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/30)
                        .stroke(Color(settings.descriptionTextColor), lineWidth: 0.4)
                )
        }
        
    }
}
