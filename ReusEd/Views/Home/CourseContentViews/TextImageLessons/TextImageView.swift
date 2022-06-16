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
        
        //        ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center) {
            if let text = textImage.text {
                
                Text(text)
                    .font(.custom(lessonSettingsData.descriptionFont, size: 14))
                    .padding(.horizontal, 0)
            }
            
          
            
            if let image = textImage.image {
                AnyView(
                    Image(image)
                        .resizable()
                        .scaledToFit()
//                        .aspectRatio(contentMode: .fit)
                )
                    
                ////                        .padding(.horizontal, 20)
            } else {
                EmptyView()
            }
            
        }
        //            .padding()
        //        }
        
        
    }
}

struct TextImageView_Previews: PreviewProvider {
    static var previews: some View {
        TextImageView(textImage: textImageLesson.textImageSections[0].textImages[0])
    }
}

extension Image {

    public init?(data: Data?) {
        guard let data = data,
            let uiImage = UIImage(data: data) else {
                return nil
        }
        self = Image(uiImage: uiImage)
    }
}
