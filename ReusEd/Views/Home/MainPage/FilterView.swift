//
//  FilterView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct FilterView: View {
    var settings: ViewAssets
    @Binding var applyFilter: Bool
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Button(
                action: {
                    print("sdfhsdfh")
                }, label: {
                    Text("Show me saved")
                        .font(Font.custom(settings.titleFont, size: 16))
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .background(Color(settings.primaryColor))
                        .accentColor(Color(settings.buttonTextColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }
            )
            
            Button(
                action: {
//                    if self.type != .popular {
//                        self.applyFilter.toggle()
//                    }
                    dismiss()
                    
                }, label: {
                    Text("Filter Courses")
                        .font(Font.custom(settings.titleFont, size: 16))
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .background(Color(settings.primaryColor))
                        .accentColor(Color(settings.buttonTextColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }
            )
        }
    }
}
