//
//  CourceTopicCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//

import SwiftUI

struct CourseDetailTopicCellView: View {
    @State var lesson: Lesson
    var settings: ViewAssets
    @ObservedObject var coursesViewModel: CoursesViewModel
    
    var icon: String {
        switch lesson.type {
        case "text":
            return icons.documentIcon
        case "video":
            return icons.videoIcon
        default:
            return icons.quizIcon
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(icon)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(lesson.title)
                    .font(.custom(settings.titleFont, size: 14))
                    .foregroundColor(Color(settings.mainTextColor))
                Text(lesson.description)
                    .font(.custom(settings.descriptionFont, size: 12))
                    .foregroundColor(Color(settings.descriptionTextColor))
                    .multilineTextAlignment(.leading)
                HStack(alignment: .center) {
                    
                    ProgressView(value: coursesViewModel.lessons[lesson.id-1].progress * 100, total: 100)
                        .accentColor(lesson.progress != 1 ? Color(settings.primaryColor) : Color(.green))
                        .padding(.trailing, 20)
                    
                    Text("\(Int((coursesViewModel.lessons[lesson.id-1].progress * 100).rounded())) %")
                        .font(.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.mainTextColor))
                        .padding(.trailing, 20)
                }
                
            }
            
            Spacer()
        }
    }
}
