//
//  FilterButtonView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import SwiftUI

struct FilterButtonView: View {
    
    var id: Int
    var title: String
    var titleFont: String
    var titleColor: UIColor
    var pressColor: UIColor
    
    @Binding var showCategory: Set<Int>
    @State private var didTap: Bool = false
    
    var body: some View {
        VStack {
            Button(
                action: {
                    self.didTap.toggle()
                    if didTap == true {
                        self.showCategory.insert(id)
                    } else {
                        self.showCategory.remove(id)
                    }
                },
                label: {
                    VStack {
                        Text(title)
                            .padding(.all, 10)
                            .font(Font.custom(titleFont, size: 14))
                            .foregroundColor(Color(titleColor))
                            .background(didTap ?  Color(pressColor): Color.white)
                        
                    }.cornerRadius(UIScreen.main.bounds.width/40)
                        .overlay(
                            RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/40)
                                .stroke(.gray, lineWidth: 0.4)
                        )
                    
                })
        }
        
    }
}
