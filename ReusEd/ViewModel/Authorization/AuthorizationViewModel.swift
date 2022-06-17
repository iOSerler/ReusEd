//
//  AuthorizationViewModel.swift
//  ReusEd
//
//  Created by Danila on 13.06.2022.
//

import FirebaseAuth

class AuthorizationViewModel: ObservableObject {

    enum AuthorizationForm {
        case signIn, signUp
    }

    @Published var currentType: AuthorizationForm =
        AuthorizationViewModel.wasAuthorized ? .signIn : .signUp
    
    @Published var isLoading = false

    var onAuthorized: ((AuthorizationResult) -> Void)?

    func signUp(name: String, email: String, password: String) {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard error == nil, let authResult = authResult else {
                return
            }
            
            let result = AuthorizationResult(
                user: AppUser(authResult.user),
                type: .signIn
            )
            self?.completeAuthorization(with: result)
        }
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard error == nil, let authResult = authResult  else {
                return
            }
            
            let result = AuthorizationResult(
                user: AppUser(authResult.user),
                type: .signIn
            )
            self?.completeAuthorization(with: result)
        }
    }

    private func completeAuthorization(with result: AuthorizationResult) {
        AuthorizationViewModel.wasAuthorized = true
        isLoading = false
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

fileprivate extension AppUser {
    init(_ user: User) {
        self.id = user.uid
        self.displayName = user.displayName
        self.email = user.email
    }
}
