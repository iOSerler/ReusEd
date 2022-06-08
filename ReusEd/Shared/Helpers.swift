//
//  Helpers.swift
//  ReusEd
//
//  Created by Ahror Jabborov on 6/8/22.
//

import Foundation
import SwiftUI

enum OnBoardingOptions {
    case introductionPages
    case notificationPermission
    case personalizationPages
    case authorization
    case homeTabView
}


class ViewRouter: ObservableObject {
     // HERE TO SPECIFY THE STARTING POINT USING USERDEFAULTS
    @State var isPresented =  UserDefaults.standard.bool(forKey: "OnBoardingPresented")
    @State var isPermissionGranted =  UserDefaults.standard.bool(forKey: "permissionGranted")
    @Published var currentPage: OnBoardingOptions = .introductionPages
    
}
