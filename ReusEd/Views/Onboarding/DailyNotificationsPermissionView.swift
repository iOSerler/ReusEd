//
//  DailyNotificationsPermissionView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

struct DailyNotificationsPermissionView: View {
    var settings: ViewAssets
    var body: some View {
        ZStack {
            DailyNotificationsView(settings: settings)
        }
    }
}

struct DailyNotificationsPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        DailyNotificationsPermissionView(settings: viewAssets)
    }
}

struct DailyNotificationsView: View {
    var settings: ViewAssets
    let notify = NotificationHandler()
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {
            
            VStack(alignment: .center) {
                VStack(alignment: .center, spacing: UIScreen.main.bounds.width / 7) {
                    Image(viewAssets.bookLogo)
                    
                    Text(notificationPermissionData.title)
                        .font(Font.custom(settings.titleFont, size: 20))
                        .foregroundColor(Color(settings.mainTextColor))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(idealHeight: .infinity)
                    
                    VStack(alignment: .center, spacing: 20) {
                        Image(notificationPermissionData.alertImage)
                        
                        Image(notificationPermissionData.arrowImage)
                            .offset(x: UIScreen.main.bounds.width/8, y: 0)
                        
                        Text(notificationPermissionData.description)
                            .font(Font.custom(settings.titleFont, size: 14))
                            .foregroundColor(Color(settings.descriptionTextColor))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(idealHeight: .infinity)
                            .padding(.horizontal)
                    }
                }
                
                Spacer()
                
                Button(
                    action: {
                        notify.askPermission(viewRouter: viewRouter)
                    }, label: {
                        Text("Continue")
                            .font(Font.custom(settings.titleFont, size: 16))
                            .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                            .background(Color(settings.primaryColor))
                            .accentColor(Color(settings.buttonTextColor))
                            .cornerRadius(UIScreen.main.bounds.width/35)
                            .padding(.bottom, UIScreen.main.bounds.height/30)
                    }
                )
            }
            .padding(.top, UIScreen.main.bounds.height/20)
            //            .padding(.all)
        }
    }
}
