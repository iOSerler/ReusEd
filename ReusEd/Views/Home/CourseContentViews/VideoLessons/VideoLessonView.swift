//
//  VideoLessonView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import SwiftUI
import AVKit

struct VideoLessonView: View {
    
    var info: VideoLesson
    
    @State var player = AVPlayer()
    
    var body: some View {
        VStack {
            VideoPlayer(player: self.player)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .center)
            .scaledToFit()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Text(info.title)
                    
                    HStack {
                        Image(info.durationImage)
                        Text(info.duration)
                    }
                    
                    Text(info.description)
                    
                    HStack {
                        Text("Video Stamps")
                        Text("- Click to watch directly")
                    }
                    
                    ForEach(0..<info.stamps.count) { ind in
                        Text(String(info.stamps[ind].text))
                            .onTapGesture {
                                player.seek(to: CMTime(seconds: info.stamps[ind].seconds,
                                                       preferredTimescale: player.currentTime().timescale))
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
        VideoLessonView(info: videoLesson)
    }
}
