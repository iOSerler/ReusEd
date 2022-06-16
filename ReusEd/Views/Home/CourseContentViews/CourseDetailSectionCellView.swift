//
//  CourseDetailSectionCellView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/15/22.
//

import SwiftUI

struct CourseDetailSectionCellView: View {
    @State var section: CourseSection
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(section.title)
                    .font(.custom(courseDetailAssets.sectionNameFont!, size: 14))
                    .foregroundColor(Color(courseDetailAssets.sectionNameColor!))
                ForEach(section.topics) { topic in
                    NavigationLink(destination: TextImageLessonView(textImageLesson: textImageLesson)) {
                        CourseDetailTopicCellView(topic: topic)
                        Divider()
                            .padding(.vertical, 20)
                    }
                    
                }
                
            }
            
            Spacer()
        }
        
        
    }
}

struct CourseDetailSectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailSectionCellView(section: courses[0].detail!.sections[0])
    }
}
