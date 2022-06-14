//
//  SearchBarView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct SearchBarView: View {
    var settings: MainPageData
    
    @Binding var searchText: String
    @State private var isEditing: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width - (isEditing ? 100: 40))
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(settings.descriptionColor), lineWidth: 0.4))
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search for courses ...", text: $searchText)
                        .font(Font.custom(settings.descriptionFont, size: 14))
                        .foregroundColor(Color(settings.descriptionColor))
                }
                .frame(width: UIScreen.main.bounds.width - (isEditing ? 120: 80))
                .foregroundColor(Color(settings.descriptionColor))
                .padding(.leading, 13)
                .onTapGesture(perform: {
                    isEditing = true
                })
                
                Spacer()
                isEditing ? Text("Cancel")
                    .font(Font.custom(settings.descriptionFont, size: 16))
                    .foregroundColor(Color(settings.additionalTextColor))
                    .padding(.trailing, 5)
                    .onTapGesture(perform: {
                        isEditing = false
                        UIApplication.shared
                            .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) : nil
            }
        }.frame(height: UIScreen.main.bounds.height/22)
         .padding([.leading, .trailing], UIScreen.main.bounds.width/25)
    }
}
