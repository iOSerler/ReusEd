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
            DailyNotificationsView()
        }.onAppear() {
            UserDefaults.standard.set(true, forKey: "IntroductionPagesPassed")
        }
    }
}

struct DailyNotificationsPermissionView_Previews: PreviewProvider {
    static var previews: some View {
        DailyNotificationsPermissionView()
    }
}

struct DailyNotificationsView: View {
    let notify = NotificationHandler()
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack {

            VStack(alignment: .center) {
                VStack(alignment: .center, spacing: UIScreen.main.bounds.width / 7) {
                    Image(notificationPermissionData.logoImage)

                    Text(notificationPermissionData.title)
                        .font(Font.custom(notificationPermissionData.titleFont, size: 20))
                        .foregroundColor(Color(notificationPermissionData.titleColor))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(idealHeight: .infinity)

                    VStack(alignment: .center, spacing: 20) {
                        Image(notificationPermissionData.alertImage)

                        Image(notificationPermissionData.arrowImage)
                            .offset(x: UIScreen.main.bounds.width/8, y: 0)

                        Text(notificationPermissionData.description)
                            .font(Font.custom(notificationPermissionData.titleFont, size: 14))
                            .foregroundColor(Color(notificationPermissionData.descriptionColor))
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
                            .font(Font.custom("Rubik-Medium", size: 16))
                            .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                            .background(Color(notificationPermissionData.buttonColor))
                            .accentColor(Color(notificationPermissionData.buttonTextColor))
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
