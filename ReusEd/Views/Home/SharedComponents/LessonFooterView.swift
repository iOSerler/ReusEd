//
//  LessonFooterView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 16.06.2022.
//

import SwiftUI

struct LessonFooterView: View {
    var settings: LessonSettingsData
    
    var body: some View {
        VStack(alignment: .center) {
            Text(settings.copyrightText)
                .font(Font.custom(settings.descriptionFont, size: 12))
                .foregroundColor(Color(settings.copyrightColor))
                .multilineTextAlignment(.center)
                .frame(width: UIScreen.main.bounds.width/2,
                       alignment: .center)
            
            HStack {
                Button(
                    action: {
                        // do something
                    }, label: {
                        VStack(alignment: .leading) {
                            Image(settings.previousBottonImage)
                                .frame(width: 30, height: 30, alignment: .center)
                            Text(settings.priviousButtonText)
                                .font(Font.custom(settings.descriptionFont, size: 12))
                                .foregroundColor(Color(settings.titleColor))
                        }
                        
                    }
                )
                
                Spacer()
                
                Button(
                    action: {
                        // do something
                    }, label: {
                        VStack(alignment: .trailing) {
                            Image(settings.nextButtonImage)
                                .frame(width: 30, height: 30, alignment: .center)
                            Text(settings.nextButtonText)
                                .font(Font.custom(settings.descriptionFont, size: 12))
                                .foregroundColor(Color(settings.titleColor))
                                .padding(.trailing, 3)
                        }
                        
                    }
                )
            }
        }
    }
}
