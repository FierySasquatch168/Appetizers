//
//  String+Extension.swift
//  Appetizers
//
//  Created by Aleksandr Eliseev on 21.02.2023.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        // google regular expressions for...
        let emailFormat         = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate      = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
