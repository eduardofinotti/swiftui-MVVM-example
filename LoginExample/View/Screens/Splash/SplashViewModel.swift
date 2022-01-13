//
//  SplashViewModel.swift
//  LoginExample
//
//  Created by Eduardo Finotti on 12/01/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    // State para gerenciar o estado da tela (se ta loading, se tem q ir pro login, pra home...)
    @Published var uiState: SplashUIState = .loading
    
    func verifyUserLogged() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.uiState = .goToLogin
        }
    }
}

extension SplashViewModel {
    func goToLoginScreen() -> some View {
        let viewModel = LoginViewModel()
        return LoginView(viewModel: viewModel)
    }
}

