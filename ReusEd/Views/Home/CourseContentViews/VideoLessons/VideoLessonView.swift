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
    @ObservedObject var coursesViewModel: CoursesViewModel
    
    @State var player: AVPlayer
    
    init( settings: ViewAssets, videoLesson: Lesson, coursesViewModel: CoursesViewModel) {
        self.settings = settings
        self.videoLesson = videoLesson
        self.player = AVPlayer(url: URL(string: videoLesson.url!)!)
        self.coursesViewModel = coursesViewModel
    }
    
    var body: some View {
        VStack {
            
            AutoRotateVideoPlayerView(player: $player)
                .onAppear {
                    DispatchQueue.main.async {
                        
                        let progress = coursesViewModel.getLessonProgress(userId: 1, lessonId: self.videoLesson.id)
                        
                        player.seek(to: CMTime(seconds: progress * CMTimeGetSeconds(player.currentItem!.asset.duration), preferredTimescale: 1))
                        //                        if self.coursesViewModel.lessons[self.videoLesson.id-1].currentTime != nil {
                        //                            player.seek(to: CMTime(seconds: self.coursesViewModel.lessons[self.videoLesson.id-1].currentTime!, preferredTimescale: player.currentTime().timescale))
                        //                        } else {
                        //                            player.seek(to: CMTime(seconds: 0, preferredTimescale: 1))
                        //                        }
                    }
                }
                .onWillDisappear {
                    DispatchQueue.main.async {
                        coursesViewModel.saveLessonProgress(userId: 1, lessonId: self.videoLesson.id, progress: CMTimeGetSeconds(player.currentTime())/CMTimeGetSeconds(player.currentItem!.asset.duration))
                        
                        //                        self.coursesViewModel.lessons[self.videoLesson.id-1].currentTime = CMTimeGetSeconds(player.currentTime())
                        //                        self.coursesViewModel.updateLessonProgress(lessonId: videoLesson.id, progress: CMTimeGetSeconds(player.currentTime())/CMTimeGetSeconds(player.currentItem!.asset.duration))
                        //                        print(self.coursesViewModel.lessons[self.videoLesson.id-1].currentTime!, self.coursesViewModel.lessons[self.videoLesson.id-1].progress)
                    }
                }
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    VideoDescriptionView(settings: settings,
                                         title: videoLesson.title,
                                         durationImage: icons.timeImage,
                                         duration: videoLesson.duration,
                                         description: videoLesson.description)
                    
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
