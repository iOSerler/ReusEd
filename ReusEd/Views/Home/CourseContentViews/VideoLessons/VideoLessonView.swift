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
                    Text(info.title)
                        .font(Font.custom(settings.titleFont, size: 18))
                        .foregroundColor(Color(settings.titleColor))
                    
                    HStack {
                        Image(info.durationImage)
                        Text(info.duration)
                            .font(Font.custom(settings.descriptionFont, size: 14))
                            .foregroundColor(Color(settings.additionalTextColor))
                    }
                    
                    Text(info.description)
                        .font(Font.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.descriptionColor))
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("Video Stamps")
                            .font(Font.custom(settings.titleFont, size: 18))
                            .foregroundColor(Color(settings.titleColor))
                        Text("- Click to watch directly")
                            .font(Font.custom(settings.descriptionFont, size: 12))
                            .foregroundColor(Color(settings.additionalTextColor))
                    }
                    
                    ForEach(0..<info.stamps.count) { ind in
                        HStack {
                            Text("\u{2022}")
                                .foregroundColor(Color(settings.titleColor))
                            Text(String(info.stamps[ind].textTime))
                                .font(Font.custom(settings.descriptionFont, size: 14))
                                .foregroundColor(Color(settings.timeStampsColor))
                                .onTapGesture {
                                    player.seek(to: CMTime(seconds: info.stamps[ind].seconds,
                                                           preferredTimescale: 1))
                                }
                            
                            Text(": "+String(info.stamps[ind].textDescription))
                                .font(Font.custom(settings.descriptionFont, size: 14))
                                .foregroundColor(Color(settings.titleColor))
                            
                        }
                    }
                    
                }.padding()
            }
            
            Spacer()
            
        }.ignoresSafeArea()
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
