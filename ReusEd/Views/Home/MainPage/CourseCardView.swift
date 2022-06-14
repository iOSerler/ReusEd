//
//  CourseCardView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct CourseCardView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/4)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color("Gray"), lineWidth: 1))
            
        }
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCardView()
    }
}
