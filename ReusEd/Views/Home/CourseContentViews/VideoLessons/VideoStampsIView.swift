//
//  VideoStampsIView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 16.06.2022.
//

import SwiftUI
import AVKit

struct VideoStampsIView: View {
    var settings: LessonSettingsData
    var stamps: [Stamp]
    @Binding var player: AVPlayer
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                Text("Video Stamps")
                    .font(Font.custom(settings.titleFont, size: 18))
                    .foregroundColor(Color(settings.titleColor))
                Text("- Click to watch directly")
                    .font(Font.custom(settings.descriptionFont, size: 12))
                    .foregroundColor(Color(settings.additionalTextColor))
            }
            
            ForEach(0..<stamps.count) { ind in
                HStack {
                    Text("\u{2022}")
                        .foregroundColor(Color(settings.titleColor))
                    Text(String(stamps[ind].textTime))
                        .font(Font.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.timeStampsColor))
                        .onTapGesture {
                            player.seek(to: CMTime(seconds: stamps[ind].seconds,
                                                   preferredTimescale: 1))
                        }
                    
                    Text(": "+String(stamps[ind].textDescription))
                        .font(Font.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.titleColor))
                    
                }
            }
        }
    }
}
