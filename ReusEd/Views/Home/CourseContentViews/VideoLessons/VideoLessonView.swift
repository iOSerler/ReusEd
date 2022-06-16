//
//  VideoLessonView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import SwiftUI
import AVKit

struct VideoLessonView: View {
    
    var settings: LessonSettingsData = lessonSettingsData
    
    var info: VideoLesson = videoLesson
    
    @State var player = AVPlayer()
    
    var body: some View {
        VStack {
            
            AutoRotateVideoPlayerView(player: $player)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height/3,
                       alignment: .center)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VideoDescriptionView(settings: settings,
                                         title: info.title,
                                         durationImage: info.durationImage,
                                         duration: info.duration,
                                         description: info.description)
                    
                    VideoStampsIView(settings: settings,
                                     stamps: info.stamps,
                                     player: $player)
                    
                    LessonFooterView(settings: settings)
                        .padding(.leading, 8)
                       
                    
                }.padding()
            }
            
        }
        .onAppear {
            self.player = AVPlayer(url: URL(string: info.url)!)
        }
    }
}

struct VideoLessonView_Previews: PreviewProvider {
    static var previews: some View {
        VideoLessonView()
    }
}
