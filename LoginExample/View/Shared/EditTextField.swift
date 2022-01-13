//
//  EditTextField.swift
//  LoginExample
//
//  Created by Eduardo Finotti on 12/01/22.
//

import SwiftUI

struct EditTextField: View {
    
    @Binding var text: String
    
    var label: String = ""
    var textFieldLength: CGFloat = 310
    var keyboard: UIKeyboardType = .default
    var isSecure: Bool = false
    
    var icon: String = ""
    var isValidated: Bool = false
    var isInvalid: Bool = false
    
    @State var showPassword: Bool = false
    
    var body: some View {
        VStack {
            if isSecure {
                Text(label)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(Color.gray)
                    .font(Font.system(size: 13))

                HStack {
                    HStack {
                        if showPassword {
                            TextField("", text: $text)
                                .frame(width: textFieldLength, height: 10, alignment: .center)
                                .multilineTextAlignment(.leading)
                                .keyboardType(keyboard)
                                .autocapitalization(.none)
                        } else {
                            SecureField("", text: $text)
                                .frame(width: textFieldLength, height: 10, alignment: .center)
                                .multilineTextAlignment(.leading)
                                .keyboardType(keyboard)
                                .autocapitalization(.none)
                        }
                           
                        Button(action: {
                            self.showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(Color("primaryColor"))
                        }
                    }
                }
                
            } else {
                
                Text(label)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .foregroundColor(Color.gray)
                    .font(Font.system(size: 13))

                HStack {
                    HStack {
                        TextField("", text: $text)
                            .frame(width: textFieldLength, height: 10, alignment: .center)
                            .multilineTextAlignment(.leading)
                            .keyboardType(keyboard)
                            .autocapitalization(.none)
                        
                        if !isValidated && icon != "" {
                            Image(systemName: icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15, alignment: .center)
                                .foregroundColor(Color("primaryColor"))
                        } else{
                            if(!text.isEmpty){
                                Image(systemName: isInvalid ? "xmark" : "checkmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .foregroundColor(isInvalid ? .red : Color("primaryColor"))
                            } else {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15, alignment: .center)
                                    .foregroundColor(.white)
                            }
                           
                        }
                    }
                }
            }
            
            Divider()
                .frame(maxHeight: 0.5)
                .background(Color("primaryColor"))
            
        }
        .frame(maxWidth: .infinity, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
        .padding(.horizontal, 40)
    }
}

struct EditTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EditTextField(text: .constant("asuhasuhas"), label: "E-mail", textFieldLength: 310, keyboard: .emailAddress, isSecure: false, icon: "", isValidated: true, isInvalid: false)
        }.padding(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
