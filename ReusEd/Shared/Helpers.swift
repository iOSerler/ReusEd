//
//  Helpers.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import Foundation
import SwiftUI

enum ViewRouterOptions {
    case introductionPages
    case notificationPermission
    case personalizationPages
    case authorization
    case homeTabView
}


class ViewRouter: ObservableObject {
    @Published var currentPage: ViewRouterOptions = .introductionPages
    
}
