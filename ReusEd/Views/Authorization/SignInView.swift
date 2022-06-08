//
//  SignInView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            Text("This is Sign in View")
            Button(action: {
                DispatchQueue.main.async {
                    withAnimation {
                        viewRouter.currentPage = .homeTabView
                    }
                }
            }) {
                Text("Continue")
                    .font(Font.custom("Rubik-Medium", size: 16))
                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                    .background(Color(notificationPermissionData.buttonColor))
                    .accentColor(Color(notificationPermissionData.buttonTextColor))
                    .cornerRadius(UIScreen.main.bounds.width/35)
                    .padding(.bottom, UIScreen.main.bounds.height/30)
            }.onAppear(){
                UserDefaults.standard.set(true, forKey: "OnBoardingPassed")
            }
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
