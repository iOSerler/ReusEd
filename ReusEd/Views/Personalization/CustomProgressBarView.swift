//
//  CustomProgressBarView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 17.06.2022.
//

import SwiftUI

struct CustomProgressBarView: View {
    var settings: ViewAssets
    var numQuestions: Int
    @Binding var progress: Int
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(1..<numQuestions, id: \.self) { ind in
                HStack {
                    ZStack {
                        Circle()
                            .scale(x: 1, y: 1)
                            .foregroundColor(ind > self.progress ?
                                             Color(settings.primaryLighterColor) :
                                                Color(settings.primaryColor))
                        Text(String(ind))
                            .font(Font.custom(settings.descriptionFont, size: 12))
                            .foregroundColor(ind > self.progress ?
                                             Color(settings.primaryLightColor) :
                                                Color(settings.buttonTextColor))
                    }.frame(height: 20, alignment: .center)
                    
                    
                    Divider()
                        .rotationEffect(.degrees(90))
                }
            }
            
            ZStack {
                Circle()
                    .scale(x: 1, y: 1)
                    .foregroundColor(numQuestions > self.progress ?
                                     Color(settings.primaryLighterColor) :
                                        Color(settings.primaryColor))
                Image(systemName: "checkmark")
                    .font(Font.custom(settings.descriptionFont, size: 12))
                    .foregroundColor(numQuestions > self.progress ?
                                     Color(settings.primaryLightColor) :
                                        Color(settings.buttonTextColor))
            }.frame(height: 20, alignment: .center)
            
            
            Spacer()
            
        }.frame(height: 45, alignment: .center)
            .padding(.horizontal)
    }
}
