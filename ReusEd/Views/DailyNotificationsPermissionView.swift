//
//  DailyNotificationsPermissionView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

struct DailyNotificationsPermissionView: View {
    var body: some View {
        ZStack {
            DailyNotificationsView(logoImage: "Logo 5", title: "Get daily reminders to meet your personal goals.", description: "You’ll get daily reminders about your courses and new daily deals from our shop.", alertImage: "Frame 2", arrowImage: "up-arrow 1", buttonColor: Color("Primary"), titleColor: Color("MainText"), descriptionColor: Color("Gray"))
        }.onAppear(){
            UserDefaults.standard.set(true, forKey: "OnBoardingPresented")
        }
    }
}

struct DailyNotificationsPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        DailyNotificationsPermissionView()
    }
}


struct DailyNotificationsView: View {
    
    var logoImage: String
    var title: String
    var description: String
    var alertImage: String
    var arrowImage: String
    var buttonColor: Color
    var titleColor: Color
    var descriptionColor: Color
    var buttonTextColor: Color = .white
    
    let notify = NotificationHandler()
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center) {
                VStack(alignment: .center, spacing: UIScreen.main.bounds.width/7){
                    Image(logoImage)
                    
                    Text(title)
                        .font(Font.custom("Rubik-Medium", size: 20))
                        .foregroundColor(titleColor)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(idealHeight: .infinity)
                        
                        
                    VStack(alignment: .center, spacing: 20){
                    Image(alertImage)
                    
                    Image(arrowImage)
                        .offset(x: UIScreen.main.bounds.width/8, y: 0)
                    
                    Text(description)
                        .font(Font.custom("Rubik-Regular", size: 14))
                        .foregroundColor(descriptionColor)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(idealHeight: .infinity)
                        
                    }
                }
                
                Spacer()
                
                Button(action: {
                    notify.askPermission()
                    //go to another view
                }) {
                    Text("Continue")
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .background(buttonColor)
                        .accentColor(buttonTextColor)
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }
            }
            .padding(.top, UIScreen.main.bounds.height/20)
            .padding(.all)
            
        }
    }
}




