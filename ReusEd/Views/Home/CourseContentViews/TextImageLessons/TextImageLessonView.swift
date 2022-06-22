//
//  TextImageLessonView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

struct TextImageLessonView: View {
    var settings: ViewAssets
    var textLesson: Lesson
    @ObservedObject var coursesViewModel: CoursesViewModel
    @State private var scrollViewHeight: CGFloat = 0
    @State private var proportion: CGFloat = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text(textLesson.description)
                    .font(.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.descriptionTextColor))
                    .multilineTextAlignment(.leading)
                HStack {
                    Image(icons.durationOffIcon)
                    
                    Text(textLesson.duration)
                        .font(.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.detailsTextColor))
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding(.leading, 20)
                
                VStack {
                    ForEach(textLesson.sections!) { section in
                        TextImageLessonSectionView(settings: settings, section: section)
                    }
                    
                    
                    LessonFooterView(settings: settings)
                        .padding(.leading, 8)
                }.navigationTitle(textLesson.title)
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(.horizontal, 20)
            }
            .background(
                GeometryReader { geo in
                    let scrollLength = geo.size.height - scrollViewHeight
                    let rawProportion = -geo.frame(in: .named("scroll")).minY / scrollLength
                    let proportion = min(max(rawProportion, 0), 1)
                    
                    Color.clear
                        .preference(
                            key: ScrollProportion.self,
                            value: proportion
                        )
                        .onPreferenceChange(ScrollProportion.self) { proportion in
                            self.proportion = proportion
                            
                        }
                }
            )
            
        }
        .onDisappear {
            print(self.proportion)
            coursesViewModel.updateLessonProgress(lessonId: self.textLesson.id, progress: self.proportion)
        }
        .background(
            GeometryReader { geo in
                Color.clear.onAppear {
                    scrollViewHeight = geo.size.height
                }
            }
        )
        .coordinateSpace(name: "scroll")
    }
}
