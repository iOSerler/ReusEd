//
//  ListView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

struct ListView: View {
    var pageSettings: ViewAssets
    var listType: String
    var displayList: [NewsItem]{
        switch listType {
        case "notifications":
            return notifications
        case "news":
            return news
        default:
            return []
        }
    }
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            if displayList.count != 0 {
                NotEmptyListView(pageSettings: pageSettings, displayList: displayList)
            } else {
                EmptyListView(settings: pageSettings, listType: listType)
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct NotEmptyListView: View {
    var pageSettings: ViewAssets
    var displayList: [NewsItem]
    @State var showDetails: Bool = false
    @State var selectedEntry: NewsItem?
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 10) {
                ForEach(displayList) { item in
                    NotificationCellView(
                        settings: pageSettings,
                        item: item)
                    .onTapGesture {
                        self.showDetails.toggle()
                        self.selectedEntry = item
                    }
                    .sheet(isPresented: $showDetails, content: {
                        NotificationDetailView(
                            settings: pageSettings,
                            item: $selectedEntry)
                    })
                    
                    Divider()
                        .padding(.horizontal, 20)
                }
            }
        }
    }
}

struct EmptyListView: View {
    var settings: ViewAssets
    var listType: String
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(settings.notificationBell)
                .padding(.bottom)
            Text("No new "+listType+" right now!")
                .font(.custom(settings.titleFont, size: 16))
                .foregroundColor(Color(settings.mainTextColor))
            Text("You’re all up-to-date. Keep up learning!")
                .font(.custom(settings.descriptionFont, size: 12))
                .foregroundColor(Color(settings.descriptionTextColor))
            
            Button(
                action: {
                    NavigationUtil.popToRootView()
                }, label: {
                    Text("Go Back to Courses")
                        .font(Font.custom(settings.titleFont, size: 14))
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                        .background(Color(settings.primaryColor))
                        .foregroundColor(Color(settings.buttonTextColor))
                        .cornerRadius(UIScreen.main.bounds.width/35)
                        .padding(.bottom, UIScreen.main.bounds.height/30)
                }
            ).padding(.top, UIScreen.main.bounds.height/15)
            
            Spacer()
        }.padding(.top, UIScreen.main.bounds.height/15)
    }
}
