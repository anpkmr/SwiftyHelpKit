//
//  Constants.swift
//  Caldersafe
//
//  Created by SwiftHelper on 8/6/18.
//  Copyright © 2018 SwiftHelper. All rights reserved.
//

import Foundation
import  UIKit

let kAppTitle = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let kAppPin = "2904"
let kPinMaximumLength = 4
let kPinMaximumNoOfEmails = 5
let kNearByDevieSearchTime = 15.0
let kAutomaticStartLocation = 60.0
let kMaximumPhotoUploadLimit = 4
let kLocationNotificaniton = "locationNotificaiton"

let kAppBundleId = Bundle.main.bundleIdentifier!
let kCollectionViewCellWidth = (UIScreen.main.bounds.width/2-10)
//MARK:- UserType
let kSupervisor = "supervisor"
let kOperator = "operator"

//MARK:- Entity Names
let kUserEmailEntiry = "UserEmails"
let kOperatorEntity = "WeldRecord"

//MARK:- Colors
let kTransparentColor = UIColor.init(white: 0.0, alpha: 0.75)

//MARK:- UserDefault keys

let kUDModuleKey = "moudleName"
let kUDLocationKey = "userLocation"
let kUDUserInfoKey = "userInfo"
let kUDfirstTimeLoginKey = "firstTimeLogged"

//MARK:- Prefix Constants
let kPrefixWeldNumber = NSLocalizedString("Weld Number: ", comment: kOtherLanugage)
let kPrefixCellWeldNumber = NSLocalizedString("Weld No. ", comment: kOtherLanugage)
let kPrefixDate = NSLocalizedString("Date: ", comment: kOtherLanugage)
let kPrefixOperatorName = NSLocalizedString("Operator Name: ", comment: kOtherLanugage)
let kPrefixMoudle =  NSLocalizedString("Module: ", comment: kOtherLanugage)



