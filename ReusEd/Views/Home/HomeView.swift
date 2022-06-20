//
//  HomeView.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import SwiftUI

struct HomeView: View {
    var settings: ViewAssets
    var tabBarSettings: TabBarData
    @State private var selection = 0
        var body: some View {

                TabView(selection: $selection) {
                    
                    MainPageView(settings: settings,
                                 coursesViewModel: CoursesViewModel(
                                    courses: courses,
                                    categories: categories,
                                    categoryCourses: categoryCourses))
                        .tabItem {
                            selection == 0 ? Image(tabBar.tab1OnImage) : Image(tabBar.tab1OffImage)
                            Text(tabBar.tab1Title)
                                .font(.custom(settings.descriptionFont, size: 14))
                        }
                        .tag(0)

                    ScoresView()
                        .tabItem {
                            selection == 1 ? Image( tabBar.tab2OnImage) : Image( tabBar.tab2OffImage)
                            Text(tabBar.tab2Title)
                                .font(.custom(settings.descriptionFont, size: 14))
                        }
                        .tag(1)

                    SavedCoursesListView(courses: courses, settings: settings, coursesListType: .saved)
                        .tabItem {
//                            selection == 2 ? Image( tabBar.tab3OnImage) : Image(tabBar.tab3OffImage)
                            selection == 2 ?
                                Image(systemName: "arrow.down.to.line.circle") : Image(systemName: "arrow.down.to.line")
                            Text(tabBar.tab3Title)
                                .font(.custom(settings.descriptionFont, size: 14))
                        }
                        .tag(2)

                    ProfileView(settings: settings)
                        .tabItem {
                            selection == 3 ? Image( tabBar.tab4OnImage) : Image(tabBar.tab4OffImage)
                            Text(tabBar.tab4Title)
                                .font(.custom(settings.descriptionFont, size: 14))
                        }
                        .tag(3)
                }.accentColor(Color(settings.primaryColor))

        }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(settings: viewAssets, tabBarSettings: tabBar)
    }
}
