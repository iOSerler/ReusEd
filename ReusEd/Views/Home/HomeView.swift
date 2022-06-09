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
                        selection == 0 ? Image(tabBar.tab1OnImage) : Image(tabBar.tab1OffImage)
                        Text(tabBar.tab1Title)
                            .font(.custom(tabBar.textFont, size: 14))
                    }
                    .tag(0)

                Tab2TestView()
                    .tabItem {
                        selection == 1 ? Image( tabBar.tab2OnImage) : Image( tabBar.tab2OffImage)
                        Text(tabBar.tab2Title)
                            .font(.custom(tabBar.textFont, size: 14))
                    }
                    .tag(1)
                
                Tab3TestView()
                    .tabItem {
                        selection == 2 ? Image( tabBar.tab3OnImage) : Image(tabBar.tab3OffImage)
                        Text(tabBar.tab3Title)
                            .font(.custom(tabBar.textFont, size: 14))
                    }
                    .tag(2)
                
                Tab4TestView()
                    .tabItem {
                        selection == 3 ? Image( tabBar.tab4OnImage) : Image(tabBar.tab4OffImage)
                        Text(tabBar.tab4Title)
                            .font(.custom(tabBar.textFont, size: 14))
                    }
                    .tag(3)
            }.accentColor(Color(tabBar.textColor))
        }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
