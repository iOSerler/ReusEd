//
//  Question1View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct Question1View: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15){
                Image(question1.stepsImage)
                
                Text(question1.title)
                    .font(Font.custom("Rubik-Medium", size: 20))
                    .foregroundColor(Color(notificationPermissionData.titleColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(idealHeight: .infinity)
                
                Text(question1.description)
                    .font(Font.custom("Rubik-Regular", size: 14))
                    .foregroundColor(Color(notificationPermissionData.descriptionColor))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(idealHeight: .infinity)
                    .padding(.horizontal)
                
                List{
                    
                }
                
                Spacer()
                
                Text("Continue")
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .background(Color(notificationPermissionData.buttonColor))
                    .accentColor(Color(notificationPermissionData.buttonTextColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/30)
                
                
            }.padding(.top, UIScreen.main.bounds.height/20)
             .navigationBarHidden(true).transition(.opacity)
        }
    }
}

struct Question1View_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}
