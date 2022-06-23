//
//  CourseDetailView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct CourseDetailView: View {
    @State var course: Course
    var settings: ViewAssets
    @ObservedObject var coursesViewModel: CoursesViewModel
    @State var isText: Bool = true
    var body: some View {
        if isText {
            Text("course id \(course.id)")
        } else {
            ZStack {
                VStack {
                    
                    
                    UrlImageView(urlString: course.posterBig)
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    Spacer()
                    
                    CourseDetailMainView(settings: settings, coursesViewModel: coursesViewModel, course: course)
                    
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
    @ObservedObject var coursesViewModel: CoursesViewModel
    @State var course: Course
    @State var progress: Double = 0.0
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                if let detail = course {
                    Text(detail.title)
                        .font(.custom(settings.titleFont, size: 20))
                        .foregroundColor(Color(settings.mainTextColor))
                    
                    Text(detail.longDescription)
                        .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.descriptionTextColor))
                        .padding(.top, 20)
                    
                    HStack {
                        Image(icons.authorIcon)
                        Text(detail.author)
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
                    
                    HStack(alignment: .center) {
                        
                        ProgressView(value: self.progress * 100, total: 100)
                            .accentColor(self.progress != 1 ? Color(settings.primaryColor) : Color(.green))
                            .padding(.trailing, 20)
                        
                        Text("\(Int((self.progress * 100).rounded())) %")
                            .font(.custom(settings.descriptionFont, size: 12))
                            .foregroundColor(Color(settings.mainTextColor))
                            .padding(.trailing, 20)
                    }
                    
                    
                    Text("Lessons & Topics")
                        .font(.custom(settings.titleFont, size: 20))
                        .foregroundColor(Color(settings.mainTextColor))
                        .padding(.top, 30)
                    ForEach(detail.sections) { section in
                        CourseDetailSectionCellView(settings: settings, section: section, courseId: detail.id, coursesViewModel: coursesViewModel)
                    }
                    
                    
                    course.progress > 0.9 ?
                    NavigationLink(destination: CompleteCourseView(settings: settings, courseTitle: course.title, completionRate: course.progress * 5, numPoints: 15), label: {
                        Text("Finish Course")
                            .font(Font.custom(settings.titleFont, size: 16))
                            .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                            .background(Color(settings.primaryColor))
                            .accentColor(Color(settings.buttonTextColor))
                            .cornerRadius(UIScreen.main.bounds.width/35)
                            .padding(.leading, UIScreen.main.bounds.width/40)
                        
                    }) : nil
                    
                       
                    
                    
                }
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 50)
            
        }
        .background(.white)
        .cornerRadius(25)
        .onDidAppear {
            self.progress = coursesViewModel.saveCourseProgress(userId: 1, courseId: self.course.id)
//            self.progress = coursesViewModel.getCourseProgress(userId: 1, courseId: self.course.id)
        }
    }
    
}
