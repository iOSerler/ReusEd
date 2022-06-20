//
//  CourceTopicCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//

import SwiftUI

struct CourseDetailTopicCellView: View {
    @State var topic: CourseTopic
    var settings: ViewAssets
    
    var icon: String {
        switch topic.type {
        case .document:
            return icons.videoIcon
        case .video:
            return icons.documentIcon
        case .quiz:
            return icons.quizIcon
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(icon)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(topic.title)
                    .font(.custom(settings.titleFont, size: 14))
                    .foregroundColor(Color(settings.mainTextColor))
                Text(topic.description)
                    .font(.custom(settings.descriptionFont, size: 12))
                    .foregroundColor(Color(settings.descriptionTextColor))
                    .multilineTextAlignment(.leading)
                HStack(alignment: .center) {
                    
                    ProgressView(value: topic.progress * 100, total: 100)
                        .accentColor(topic.progress != 1 ? Color(settings.primaryColor) : Color(.green))
                        .padding(.trailing, 20)
                    
                    Text("\(Int((topic.progress * 100).rounded())) %")
                        .font(.custom(settings.descriptionFont, size: 12))
                        .foregroundColor(Color(settings.mainTextColor))
                        .padding(.trailing, 20)
                }
                
            }
            
            Spacer()
        }
    }
}
