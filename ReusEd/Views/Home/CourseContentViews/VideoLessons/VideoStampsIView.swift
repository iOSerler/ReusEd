//
//  VideoStampsIView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 16.06.2022.
//

import SwiftUI
import AVKit

struct VideoStampsIView: View {
    var settings: ViewAssets
    var stamps: [Stamp]
    @Binding var player: AVPlayer
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                Text("Video Stamps")
                    .font(Font.custom(settings.titleFont, size: 18))
                    .foregroundColor(Color(settings.mainTextColor))
                Text("- Click to watch directly")
                    .font(Font.custom(settings.descriptionFont, size: 12))
                    .foregroundColor(Color(settings.detailsTextColor))
            }
            
            ForEach(0..<stamps.count, id: \.self) { ind in
                HStack {
                    Text("\u{2022}")
                        .foregroundColor(Color(settings.mainTextColor))
                    Text(String(stamps[ind].textTime))
                        .font(Font.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.primaryColor))
                        .onTapGesture {
                            player.seek(to: CMTime(seconds: stamps[ind].seconds,
                                                   preferredTimescale: 1))
                        }
                    
                    Text(": "+String(stamps[ind].textDescription))
                        .font(Font.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.mainTextColor))
                    
                }
            }
        }
    }
}
