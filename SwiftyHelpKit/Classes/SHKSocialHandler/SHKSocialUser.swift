//
//  UserResponse.swift
//  SwiftyHelpKit
//
//  Created by SwiftyHelpKit on 8/28/18.
//  Copyright © 2018 SwiftyHelpKit. All rights reserved.
//

import Foundation
import ObjectMapper

public class SocialUser: Mappable {
    
    var firstName:String = ""
    var lastName:String = ""
    var gender:String = ""

    required public init?(map: Map) {
    }
    
    //empty constructor
    public init() {
        
    }
    
    public func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        gender <- map["gender"]
    }
    
}
