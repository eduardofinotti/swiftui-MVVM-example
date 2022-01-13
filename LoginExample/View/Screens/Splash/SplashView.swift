//
//  SplashView.swift
//  LoginExample
//
//  Created by Eduardo Finotti on 12/01/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        
        Group {
            switch viewModel.uiState {
                case .loading:
                    splash
                case .goToLogin:
                    viewModel.goToLoginScreen()
                case .goToHome:
                    Text("Deve ir pra Home")
            }
        }.onAppear(perform: viewModel.verifyUserLogged)
    }
}

extension SplashView {
    var splash: some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(30)
                .ignoresSafeArea()
        }.background(Color("primaryColor"))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
