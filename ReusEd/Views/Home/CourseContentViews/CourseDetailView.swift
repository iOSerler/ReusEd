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
                    
                       
                        Image(courseDetailAssets.courseDetailBackground!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                       
                      
                       
                    
                  
                    Spacer()
                              
                    CourseDetailMainView(settings: settings, detail: detail)
                        
                        .offset(y: -UIScreen.main.bounds.height / 5)
//                        .padding()
                        .padding(.bottom, -UIScreen.main.bounds.height / 3.9)
                    Button {
                        print("sgfdfg")
                    } label: {
                        Text("Continue")
                            .font(.custom(courseDetailAssets.beginCourseButtonFont!, size: 14))
                            .foregroundColor(Color(courseDetailAssets.beginCourseButtonTextColor!))
                        Image(courseDetailAssets.beginCourseButtonIcon!)
                            .padding(.leading, 10)
                    }
                    
                    .frame(width: UIScreen.main.bounds.width / 1.8, height: 40)
                    .background(Color("Primary"))
                    .cornerRadius(25)
                    .shadow(color: Color("Primary"), radius: 10)
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
                    //                    Image(courseDetailAssets.courseDetailBackground)
                    Text(detail.title)
                        .font(.custom(courseDetailAssets.titleFont!, size: 20))
                        .foregroundColor(Color(courseDetailAssets.titleColor!))
                    
                    Text(detail.description)
                        .font(.custom(courseDetailAssets.descriptionFont!, size: 14))
                        .foregroundColor(Color(courseDetailAssets.descriptionColor!))
                        .padding(.top, 20)
                    
                    HStack {
                        Image(courseDetailAssets.authorIcon!)
                        Text(detail.authorName)
                            .font(.custom(courseDetailAssets.authorTextFont!, size: 14))
                            .foregroundColor(Color(courseDetailAssets.authorTextColor!))
                        
                        Image(courseDetailAssets.durationOffIcon!)
                            .padding(.leading, 20)
                        Text(detail.duration)
                            .font(.custom(courseDetailAssets.authorTextFont!, size: 14))
                            .foregroundColor(Color(courseDetailAssets.authorTextColor!))
                                         
                        Spacer()
                    }
                    .padding(.top, 20)
                    Text("Lessons & Topics")
                        .font(.custom(courseDetailAssets.titleFont!, size: 20))
                        .foregroundColor(Color(courseDetailAssets.titleColor!))
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
