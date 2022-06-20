//
//  CourseDetailView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct CourseDetailView: View {
    @State var courseId: Int
    var settings: ViewAssets
    @State var isText: Bool = true
    @State var detail: CourseDetail?
    var body: some View {
        if isText {
            Text("course id \(courseId)")
        } else {
            ZStack {
                VStack {
                    
                    
                    Image(icons.courseDetailBackground)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    Spacer()
                    
                    CourseDetailMainView(settings: settings, detail: detail)
                    
                        .offset(y: -UIScreen.main.bounds.height / 5)
                        .padding(.bottom, -UIScreen.main.bounds.height / 3.9)
                    Button {
                        print("sgfdfg")
                    } label: {
                        Text("Continue")
                            .font(.custom(settings.titleFont, size: 14))
                            .foregroundColor(Color(settings.buttonTextColor))
                        Image(icons.beginCourseButtonIcon)
                            .padding(.leading, 10)
                    }
                    
                    .frame(width: UIScreen.main.bounds.width / 1.8, height: 40)
                    .background(Color(settings.primaryColor))
                    .cornerRadius(25)
                    .shadow(color: Color(settings.primaryColor), radius: 10)
                    .offset(y: -UIScreen.main.bounds.height / 1.48)
                    
                    
                }
                
            }
            
        }
    }
}

struct CourseDetailMainView: View {
    var settings: ViewAssets
    @State var detail: CourseDetail?
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                if let detail = detail {
                    Text(detail.title)
                        .font(.custom(settings.titleFont, size: 20))
                        .foregroundColor(Color(settings.mainTextColor))
                    
                    Text(detail.description)
                        .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.descriptionTextColor))
                        .padding(.top, 20)
                    
                    HStack {
                        Image(icons.authorIcon)
                        Text(detail.authorName)
                            .font(.custom(settings.descriptionFont, size: 14))
                            .foregroundColor(Color(settings.detailsTextColor))
                        
                        Image(icons.durationOffIcon)
                            .padding(.leading, 20)
                        Text(detail.duration)
                            .font(.custom(settings.descriptionFont, size: 14))
                            .foregroundColor(Color(settings.detailsTextColor))
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    Text("Lessons & Topics")
                        .font(.custom(settings.titleFont, size: 20))
                        .foregroundColor(Color(settings.mainTextColor))
                        .padding(.top, 30)
                    ForEach(detail.sections) { section in
                        CourseDetailSectionCellView(settings: settings, section: section)
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 50)
            
        }
        .background(.white)
        .cornerRadius(25)
    }
    
}
