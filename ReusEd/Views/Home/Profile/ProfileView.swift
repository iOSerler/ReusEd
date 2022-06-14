//
//  ProfileView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfileHeaderView(image: "Anna",
                              text1: "Hello 👋",
                              text2: "Anna Dluzhinskaya",
                              settings: mainPageData)
            Text("Hello, World! This is Profile View")
            Spacer()
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
