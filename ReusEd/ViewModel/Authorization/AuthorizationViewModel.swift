//
//  AuthorizationViewModel.swift
//  ReusEd
//
//  Created by Danila on 13.06.2022.
//

import Foundation

class AuthorizationViewModel: ObservableObject {

    // TODO:
    struct AuthorizationResult {
        let token: String
        let type: AuthorizationType
    }

    enum AuthorizationForm {
        case signIn, signUp
    }

    @Published var currentType: AuthorizationForm = .signIn

    var onAuthorized: ((AuthorizationResult) -> Void)?

    // TODO:
    func signUp(name: String, email: String, password: String) {
        let user = AuthorizationResult(token: "", type: .signUp)
        onAuthorized?(user)
    }

    // TODO:
    func signIn(email: String, password: String) {
        let user = AuthorizationResult(token: "", type: .signIn)
        onAuthorized?(user)
    }
}
