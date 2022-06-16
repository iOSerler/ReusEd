//
//  CourceTopicCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//

import SwiftUI

struct CourseDetailTopicCellView: View {
    @State var topic: CourseTopic
    
    var icon: String {
        switch topic.type {
        case .document:
            return courseDetailAssets.videoIcon!
        case .video:
            return courseDetailAssets.documentIcon!
        case .quiz:
            return courseDetailAssets.quizIcon!
        }
    }

    var body: some View {
        HStack(alignment: .top) {
            Image(icon)
                .padding(.leading, 20)
            VStack(alignment: .leading) {
                Text(topic.title)
                    .font(.custom(courseDetailAssets.topicTitleFont!, size: 14))
                    .foregroundColor(Color(courseDetailAssets.topicTitleColor!))
                Text(topic.description)
                    .font(.custom(courseDetailAssets.descriptionFont!, size: 12))
                    .foregroundColor(Color(courseDetailAssets.descriptionColor!))
                    .multilineTextAlignment(.leading)
                HStack(alignment: .center) {
                    
                    ProgressView(value: topic.progress * 100, total: 100)
                        .accentColor(Color(mainPageData.additionalTextColor))
                        .padding(.trailing, 20)

                    Text("\(Int((topic.progress * 100).rounded())) %")
                        .font(.custom(mainPageData.descriptionFont, size: 12))
                        .foregroundColor(.black)
                        .padding(.trailing, 20)
                }
              
            }
            
            Spacer()
        }
    }
}

struct CourseDetailTopicCellView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailTopicCellView(
            topic: courses[0].detail!.sections[0].topics[0]
        )
    }
}
