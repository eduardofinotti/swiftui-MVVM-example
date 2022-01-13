//
//  LoginExampleApp.swift
//  LoginExample
//
//  Created by Eduardo Finotti on 12/01/22.
//

import SwiftUI

@main
struct LoginExampleApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
