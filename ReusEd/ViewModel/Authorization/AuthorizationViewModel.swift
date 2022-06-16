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

    @Published var currentType: AuthorizationForm =
        AuthorizationViewModel.wasAuthorized ? .signIn : .signUp

    var onAuthorized: ((AuthorizationResult) -> Void)?

    // TODO:
    func signUp(name: String, email: String, password: String) {
        let result = AuthorizationResult(token: "", type: .signUp)
        completeAuthorization(with: result)
    }

    // TODO:
    func signIn(email: String, password: String) {
        let result = AuthorizationResult(token: "", type: .signIn)
        completeAuthorization(with: result)
    }

    private func completeAuthorization(with result: AuthorizationResult) {
        AuthorizationViewModel.wasAuthorized = true
        onAuthorized?(result)
    }
}

extension AuthorizationViewModel {
    private enum UserDefaultKeys {
        static let wasAuthorized = "wasAuthorized"
    }

    /// True if user was authorized at least once
    static private var wasAuthorized: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaultKeys.wasAuthorized)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultKeys.wasAuthorized)
        }
    }
}
