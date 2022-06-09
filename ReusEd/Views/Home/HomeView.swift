//
//  HomeView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 0
        var body: some View {
            TabView(selection: $selection) {
                Tab1TestView()
                    .tabItem {
                        selection == 0 ? Image(systemName: "house.fill") : Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)

                Tab2TestView()
                    .tabItem {
                        selection == 1 ? Image(systemName: "a.circle.fill") : Image(systemName: "hand.raised.fill")
                        Text("Away")
                    }
                    .tag(1)
                
                Tab3TestView()
                    .tabItem {
                        selection == 2 ? Image(systemName: "a.circle.fill") : Image(systemName: "hand.raised.fill")
                        Text("Away")
                    }
                    .tag(2)
                
                Tab4TestView()
                    .tabItem {
                        selection == 3 ? Image(systemName: "a.circle.fill") : Image(systemName: "hand.raised.fill")
                        Text("Away")
                    }
                    .tag(3)
            }
        }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
