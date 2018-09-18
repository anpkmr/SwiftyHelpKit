//
//  AppShared.swift
//  Caldersafe
//
//  Created by SwiftHelper on 8/8/18.
//  Copyright © 2018 SwiftHelper. All rights reserved.
//

import UIKit
import Foundation

class AppShared: NSObject {
   static let shared = AppShared()//Singletion instance of the app
    var user: SocialUser? //user Object
    var isNotificationEnaled:Bool = false
    var isConnectedToInternet:Bool = true
}
