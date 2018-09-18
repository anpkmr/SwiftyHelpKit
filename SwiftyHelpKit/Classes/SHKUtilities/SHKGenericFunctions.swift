//
//  SHKGenericFunctions.swift
//  SwiftyHelpKit
//
//  Created by SwiftyHelpKit on 7/30/18.
//  Copyright © 2018 SwiftyHelpKit. All rights reserved.
//

import Foundation



public class SHKGenericFunctions: NSObject {
    
    /// validation email
    ///
    /// - Parameter emailString: email string
    /// - Returns: if valid return true other false
    static func isValidEmail(emailString:String)-> SHKValidation {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return (NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: emailString) == true) ? .Valid:.Invalid(kInvalidEmail)
    }
    
    
    /// check if string is blank
    ///
    /// - Parameter string: string
    /// - Returns: if blank return true other false
    static func isBlank(string:String)->Bool {
        if  string.isEmpty == true || string.trimmingCharacters(in: .whitespaces).characters.count == 0 {
            return true
    }
        return false
    }
}
