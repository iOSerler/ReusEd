//
//  ProfileHeaderView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct ProfileHeaderView: View {
    var image: String
    var text1: String
    var text2: String
    var settings: MainPageData
    var body: some View {
        HStack {
            Image(systemName: image)
                .scaleEffect(2.5)
                .frame(width: UIScreen.main.bounds.width/7, height: UIScreen.main.bounds.width/7)
                .foregroundColor(.purple)
            
            VStack(alignment: .leading) {
                Text(text1)
                    .font(Font.custom(settings.descriptionFont, size: 14))
                    .foregroundColor(Color(settings.descriptionColor))
                Text(text2)
                    .font(Font.custom(settings.titleFont, size: 14))
                    .foregroundColor(Color(settings.titleColor))
            }
            Spacer()
        }
        .padding(.leading, 15)
    }
}