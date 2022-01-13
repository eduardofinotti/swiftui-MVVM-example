//
//  LoginView.swift
//  LoginExample
//
//  Created by Eduardo Finotti on 12/01/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    @State var checkRemember: Bool = false
    @State private var alert = false
    
    private let textFieldLength:CGFloat = 310
    
    var body: some View {
        
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 60)
                .padding(.vertical, 60)
            
            VStack {
                
                welcomeHeader
                
                VStack {
                    emailField
                    passworkField
                    rememberForgotPassword
                    loginButton
                }
            }
            .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .cornerRadius(60)
            .padding(.vertical, -40)
            
        }
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
        .background(Color("primaryColor"))
    }
}

extension LoginView {
    var footerSocialIcons: some View {
        Group{
            Text("ou entre com")
                .font(Font.system(size: 13))
                .padding()
            
            HStack {
                Image("face")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                
                Image("twitter")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.horizontal, 30)
                    .padding()
                
                Image("google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
            }.padding(.top, -20)
        }
    }
}

extension LoginView {
    var welcomeHeader: some View {
        VStack {
            Text("Welcome")
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .font(Font.system(size: 32))
                .foregroundColor(Color("primaryColor"))
            
            HStack {
                Text("Ainda não tem conta?")
                    .font(Font.system(size: 13))
                Text("Registre-se!")
                    .font(Font.system(size: 13).bold())
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(Color.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .topLeading)
        .padding(40)
    }
}

extension LoginView {
    var emailField: some View {
        EditTextField(text: $viewModel.email, label: "E-mail", textFieldLength: 310, keyboard: .emailAddress, isSecure: false, icon: "", isValidated: true, isInvalid: !viewModel.email.isEmail())
    }
}

extension LoginView {
    var passworkField: some View {
        EditTextField(text: $viewModel.password, label: "Senha", textFieldLength: 310, keyboard: .default, isSecure: true, icon: "checkmark").padding(.top, 20)
    }
}

extension LoginView {
    var rememberForgotPassword: some View {
        HStack {
            Button(action: {
                self.checkRemember.toggle()
            }) {
                Image(systemName: checkRemember ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(Color("primaryColor"))
            }
            
            Text("Lembrar senha")
                .foregroundColor(Color.gray)
                .font(Font.system(size: 13))
            
            Spacer()
            
            Text("Esqueci a senha")
                .foregroundColor(Color.gray)
                .font(Font.system(size: 13))
        }
        .padding(.horizontal, 40)
        .padding(.vertical)
    }
}

extension LoginView {
    var loginButton: some View {
        VStack {
            LoadingButton(action: {
                print("Entrou")
            },text: "Login", showProgress: false)
            
            footerSocialIcons
        }
        .padding(.bottom, 80)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LoginViewModel()
        LoginView(viewModel: viewModel)
    }
}
