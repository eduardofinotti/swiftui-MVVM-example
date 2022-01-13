//
//  LoadingButton.swift
//  LoginExample
//
//  Created by Eduardo Finotti on 13/01/22.
//

import SwiftUI

struct LoadingButton: View {
    
    var action: () -> Void
    var text: String
    var showProgress: Bool = false
    
    var body: some View {
        ZStack{
            Button(action: {
                action()
            }, label: {
                Text( showProgress ? "" : text)
                    .frame(maxWidth: 200, minHeight: 25)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(Font.system(size: 16).bold())
                    .background(Color("primaryColor"))
                    .foregroundColor(.white)
                    .cornerRadius(30)
            })
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .opacity(showProgress ? 1 : 0)
        }
    }
}

struct LoadingButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            LoadingButton(action: {
                print("pressionou")
            },
            text: "Entrar",
            showProgress: true)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
