//
//  UserResponse.swift
//  SwiftHelper
//
//  Created by SwiftHelper on 8/28/18.
//  Copyright © 2018 SwiftHelper. All rights reserved.
//

import Foundation
import ObjectMapper

class SocialUser: Mappable {
    
    var firstName:String = ""
    var lastName:String = ""
    var gender:String = ""

    required init?(map: Map) {
    }
    
    //empty constructor
    init() {
        
    }
    
    func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        gender <- map["gender"]
    }
    
}
