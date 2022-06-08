//
//  Question1View.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct Question1View: View {
    var body: some View {
        VStack(alignment: .center, spacing: UIScreen.main.bounds.width/15){
            Image("Question1")
            
            Text("How did your hear about us?")
                .font(Font.custom("Rubik-Medium", size: 20))
                .foregroundColor(Color(notificationPermissionData.titleColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
            
            Text("Tell us how you new about ReusEd to recommend it to more learners like you.")
                .font(Font.custom("Rubik-Regular", size: 14))
                .foregroundColor(Color(notificationPermissionData.descriptionColor))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .frame(idealHeight: .infinity)
                .padding(.horizontal)
            
            Spacer()
        }.padding(.top, UIScreen.main.bounds.height/20)
    }
}

struct Question1View_Previews: PreviewProvider {
    static var previews: some View {
        Question1View()
    }
}
