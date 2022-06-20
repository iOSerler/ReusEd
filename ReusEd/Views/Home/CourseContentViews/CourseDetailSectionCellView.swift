//
//  CourseDetailSectionCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//

import SwiftUI

struct CourseDetailSectionCellView: View {
    var settings: ViewAssets
    @State var section: CourseSection
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(section.title)
                    .font(.custom(courseDetailAssets.sectionNameFont!, size: 14))
                    .foregroundColor(Color(courseDetailAssets.sectionNameColor!))
                ForEach(section.topics) { topic in
                    NavigationLink(destination: TextImageLessonView(textImageLesson: textImageLesson)) {
                        CourseDetailTopicCellView(topic: topic, settings: settings)
                        Divider()
                            .padding(.vertical, 20)
                    }
                    
                }
                
            }
            
            Spacer()
        }
        
        
    }
}
