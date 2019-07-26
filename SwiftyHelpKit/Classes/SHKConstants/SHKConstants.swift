
//  Created by SwiftyHelpKit  on 8/6/18.
//  Copyright © 2018 SwiftyHelpKit . All rights reserved.
//

import Foundation
import  UIKit

public let kAppTitle = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
public let kAutomaticStartLocation = 60.0
public let kLocationNotificaniton = "locationNotificaiton"
public let kAppBundleId = Bundle.main.bundleIdentifier!

//MARK:- Colors
public let kTransparentColor = UIColor.init(white: 0.0, alpha: 0.75)

//MARK:- UserDefault keys
public let kUDLocationKey = "userLocation"
public let kUDUserInfoKey = "userInfo"

let kAPIStatusSuccess = 1
