//
//  NotificationDetailView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

struct NotificationDetailView: View {
    var settings: ViewAssets
    var item : NewsItem
    var body: some View {
        VStack {
            Text(item.title)
        }
    }
}
