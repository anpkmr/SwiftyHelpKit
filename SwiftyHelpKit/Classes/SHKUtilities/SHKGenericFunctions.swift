//
//  CSGenericFunctions.swift
//  SwiftHelper
//
//  Created by SwiftHelper on 7/30/18.
//  Copyright © 2018 SwiftHelper. All rights reserved.
//

import Foundation



class CSGenericFunctions: NSObject {
    
    /// validation email
    ///
    /// - Parameter emailString: email string
    /// - Returns: if valid return true other false
    static func isValidEmail(emailString:String)-> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: emailString)
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
