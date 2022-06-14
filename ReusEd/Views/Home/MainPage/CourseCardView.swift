//
//  CourseCardView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct CourseCardView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image("bigPoster1")
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Typography")
                    .font(Font.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color("MainText"))
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting.")
                    .font(Font.custom("Rubik-Regular", size: 12))
                    .foregroundColor(Color("Gray"))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: false)
                
                HStack {
                    Image("timer")
                    Text("3h 15 min")
                        .font(Font.custom("Rubik-Regular", size: 12))
                        .foregroundColor(Color("Primary"))
                        .padding(.leading, 5)
                    
                }
            }.padding([.leading, .bottom], 10)
            
        }.frame(width: UIScreen.main.bounds.width/2.5)
         .cornerRadius(UIScreen.main.bounds.width/30)
         .overlay(
                 RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/30)
                    .stroke(Color("Gray"), lineWidth: 0.4)
             )
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCardView()
    }
}
