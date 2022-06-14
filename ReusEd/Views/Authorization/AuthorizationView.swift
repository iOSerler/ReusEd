//
//  AuthorizationView.swift
//  ReUsedTest
//
//  Created by Danila on 08.06.2022.
//

import SwiftUI

public struct AuthorizationView: View {

    @StateObject var viewModel = AuthorizationViewModel()
    @StateObject var viewConfiguration = AuthorizationViewConfiguration()

    private var onCompletion: (AuthorizationViewModel.AuthorizationResult) -> Void

    init(onCompletion: @escaping (AuthorizationViewModel.AuthorizationResult) -> Void) {
        self.onCompletion = onCompletion
    }

    public var body: some View {
        ZStack {
            switch viewModel.currentType {
            case .signIn:
                SignInView()
                    .transition(.slide)
            case .signUp:
                SignUpView()
                    .transition(.slide)
            }
        }
        .environmentObject(viewModel)
        .environmentObject(viewConfiguration)
        .accentColor(viewConfiguration.colors.accent)
        .onAppear {
            viewModel.onAuthorized = onCompletion
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {

    static var previews: some View {
        AuthorizationView() { _ in }
    }
}
