//
//  CustomProgressBarView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 17.06.2022.
//

import SwiftUI

struct CustomProgressBarView: View {
    var progressBarData: ProgressBarData
    var numQuestions: Int
    @Binding var progress: Int
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(0..<numQuestions, id: \.self) { ind in
                HStack {
                    ZStack {
                        Circle()
                            .scale(x: 1, y: 1)
                            .foregroundColor(ind > self.progress ?
                                             Color(progressBarData.passiveBackgroundColor) :
                                             Color(progressBarData.activeBackgroundColor))
                        Text(String(ind+1))
                            .font(Font.custom(progressBarData.font, size: 12))
                            .foregroundColor(ind > self.progress ?
                                                Color(progressBarData.passiveTextColor) :
                                                Color(progressBarData.activeTextColor))
                    }.frame(height: 20, alignment: .center)
                     
                    
                    (ind+1) != numQuestions ?
                        Divider()
                        .rotationEffect(.degrees(90)) : nil
                }
            }
            
            Spacer()
            
        }.frame(height: 45, alignment: .center)
         .padding(.horizontal)
    }
}
