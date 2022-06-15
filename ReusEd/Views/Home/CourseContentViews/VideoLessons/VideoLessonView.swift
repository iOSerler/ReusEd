//
//  VideoLessonView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 15.06.2022.
//

import SwiftUI
import AVKit

struct VideoLessonView: View {
    
    let url: URL?
    
    @State var player = AVPlayer()
    
    var body: some View {
        VStack {
            VideoPlayer(player: self.player)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .center)
            .scaledToFit()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Summary")
                    
                    HStack {
                        Image("timer")
                        Text("15 seconds video")
                    }
                    
                    Text("Python programming language provides the following types of loops to handle looping requirements. Python provides three ways for executing the loops. While all the ways provide similar basic functionality, they differ in their syntax and condition checking time.")
                    
                    HStack {
                        Text("Video Stamps")
                        Text("- Click to watch directly")
                    }
                    
                    ForEach(0..<5) { ind in
                        Text(String(ind*2)+" Second")
                            .onTapGesture {
                                player.seek(to: CMTime(seconds: Double(ind*2),
                                                       preferredTimescale: player.currentTime().timescale))
                            }
                    }
                    
                }.padding()
            }
            
            Spacer()
            
        }.ignoresSafeArea()
        .onAppear {
            self.player = AVPlayer(url: url!)
        }
    }
}

struct VideoLessonView_Previews: PreviewProvider {
    static var previews: some View {
        VideoLessonView(url:
        URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"))
    }
}
