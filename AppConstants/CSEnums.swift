//
//  CSEnums.swift
//  Caldersafe
//
//  Created by SwiftHelper on 7/31/18.
//  Copyright © 2018 SwiftHelper. All rights reserved.
//

import Foundation
import UIKit


/// bluetooth connection state
///
/// - connected: any device is connected
/// - disconnected: device disconnected
/// - failedToConnect: not able to connect with device
/// - noStatus: other status

enum BlueToothConencttiontype{
    case connected
    case disconnected
    case failedToConnect
    case noStatus
    
}

/// Two type of server being used in this app
///
/// - chinese: chinese server
/// - caldersafe: caldersafeserver
enum ServerType:String{
    case chinese = "chinese"
    case caldersafe = "caldersafe"
}

/// user can set the diffrent option for capturing the photos
///
/// - OnlyFour: Forces the user to capture 4 imgages from camera
/// - OneToFour: user can click any number of photos from 1 to 4
enum PhotoType:String{
    case OnlyFour = "onlyfour"
    case OneToFour = "oneToFour"
}

enum UInt32Typesignal:UInt32 {
    case connecting = 0
    case sendginData = 1
}

enum UInt64Typesignal:UInt64 {
    case connecting64 = 0
    case sendginData64 = 1
    
}
enum Int8TypeSignal:UInt8 {
    case connectionOn = 0
    case connectionOff = 1
    
}
enum Int32TypeSignalType:Int32 {
    case connectingInt32 = 0
    case sendginDataInt32 = 1
}
