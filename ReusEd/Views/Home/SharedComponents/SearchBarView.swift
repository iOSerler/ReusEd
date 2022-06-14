//
//  SearchBarView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var _searchText: String
    @State private var isEditing: Bool = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width - (isEditing ? 100: 40))
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Gray"), lineWidth: 1))
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search for courses ...", text: $_searchText)
                }
                .frame(width: UIScreen.main.bounds.width - (isEditing ? 120: 80))
                .foregroundColor(.gray)
                .padding(.leading, 13)
                .onTapGesture(perform: {
                    isEditing = true
                })
                
                Spacer()
                isEditing ? Text("Cancel").onTapGesture(perform: {
                    isEditing = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) : nil
            }
        }.frame(height: 40)
            .padding()
    }
}
