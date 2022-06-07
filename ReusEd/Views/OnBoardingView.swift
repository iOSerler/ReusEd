//
//  OnBoardingView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/7/22.
//

import SwiftUI

struct OnBoardingView: View {
    @State var isPresented = false
    var body: some View {
        NavigationView{
            // some data structure here - pages
        }.sheet(isPresented: $isPresented) {
            // some other view - Permissions()
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
