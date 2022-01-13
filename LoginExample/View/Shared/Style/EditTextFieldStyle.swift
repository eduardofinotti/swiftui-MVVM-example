//
//  EditTextFieldStyle.swift
//  LoginExample
//
//  Created by Eduardo Finotti on 13/01/22.
//

import SwiftUI

struct EditTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .multilineTextAlignment(.leading)
            .autocapitalization(.none)
    }
}
