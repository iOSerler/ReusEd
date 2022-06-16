//
//  AuthorizationResult.swift
//  ReusEd
//
//  Created by Danila on 14.06.2022.
//

import Foundation

struct AuthorizationResult {
    enum AuthorizationType {

        /// When user sign in
        case signIn

        /// When user sign up
        case signUp

        /// When user was authorized
        case auto
    }
    
    /// User token
    let token: String
    
    /// Type by which user was authorized
    let type: AuthorizationType
}
