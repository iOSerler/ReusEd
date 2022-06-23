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
    
    var displayList: [NewsItem] {
        switch listType {
        case "notifications":
            return notifications
        case "news":
            return news
        default:
            return []
        }
    }
    @State var showDetails: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 10) {
                    ForEach(displayList) { item in
                        NotificationCellView(
                            settings: pageSettings,
                            item: item)
                        .onTapGesture {
                            self.showDetails.toggle()
                        }
                        .sheet(isPresented: $showDetails, content: {
                            NotificationDetailView(
                                settings: pageSettings,
                                item: item)
                        })
                        
                        Divider()
                            .padding(.horizontal, 20)
                    }
                }
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}
