//
//  Question4View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct Question4View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
        Text("Question 4")
        
        Button(action: {
            DispatchQueue.main.async {
                withAnimation {
                    viewRouter.currentPage = .authorization
                }
            }
        }) {
            Text("Continue")
                .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                .background(Color(notificationPermissionData.buttonColor))
                .accentColor(Color(notificationPermissionData.buttonTextColor))
                .cornerRadius(UIScreen.main.bounds.width/35)
                .padding(.bottom, UIScreen.main.bounds.height/30)
        }
        }
    }
}

struct Question4View_Previews: PreviewProvider {
    static var previews: some View {
        Question4View()
    }
}
