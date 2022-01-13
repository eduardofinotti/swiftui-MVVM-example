//
//  StringUtils.swift
//  LoginExample
//
//  Created by Eduardo Finotti on 13/01/22.
//

import Foundation

extension String {
    func isEmail() -> Bool{
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[AZa-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regEx).evaluate(with: self)
    }
}
