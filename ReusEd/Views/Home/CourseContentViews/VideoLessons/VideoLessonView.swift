//
//  VideoLessonView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import SwiftUI
import AVKit

struct VideoLessonView: View {
    var settings: ViewAssets
    var videoLesson: Lesson
    
    @State var player: AVPlayer
    
    init( settings: ViewAssets, videoLesson: Lesson) {
        self.settings = settings
        self.videoLesson = videoLesson
        self.player = AVPlayer(url: URL(string: videoLesson.url!)!)
    }
    
    var body: some View {
        VStack {
            
            AutoRotateVideoPlayerView(player: $player)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height/3,
                       alignment: .center)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VideoDescriptionView(settings: settings,
                                         title: videoLesson.title!,
                                         durationImage: icons.timeImage,
                                         duration: videoLesson.duration!,
                                         description: videoLesson.description!)
                    
                    VideoStampsIView(settings: settings,
                                     stamps: videoLesson.stamps!,
                                     player: $player)
                    
                    LessonFooterView(settings: settings)
                        .padding(.leading, 8)
                    
                    
                }.padding()
            }
            
        }
        .onAppear {
            print(videoLesson.url!)
        }
    }
}
