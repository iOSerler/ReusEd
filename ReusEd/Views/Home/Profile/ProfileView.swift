//
//  ProfileView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/14/22.
//

import SwiftUI

struct ProfileView: View {
    var settings: ViewAssets
    var body: some View {
        NavigationView {
            VStack {
//                ProfileHeaderView(image: "Anna",
//                                  text1: "Hello 👋",
//                                  text2: "Anna Dluzhinskaya",
//                                  settings: settings)
                Text("Hello, World! This is Profile View")
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Profile")
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(settings: viewAssets)
    }
}
