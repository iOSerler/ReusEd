//
//  TextImage.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/16/22.
//

import SwiftUI

struct TextImageView: View {
    var textImage: TextImage
    
    var body: some View {
        VStack(alignment: .leading) {
            if let text = textImage.text {
                
                Text(text)
                    .font(.custom(lessonSettingsData.descriptionFont, size: 14))
                    .foregroundColor(Color(lessonSettingsData.titleColor))
                    .padding(.horizontal, 0)
                    .multilineTextAlignment(.leading)
            }
            

            if let image = textImage.image {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct TextImageView_Previews: PreviewProvider {
    static var previews: some View {
        TextImageView(textImage: textImageLesson.textImageSections[0].textImages[0])
    }
}
