//
//  CSLocationfetchTimer.swift
//  SwiftHelper
//
//  Created by SwiftHelper on 8/9/18.
//  Copyright © 2018 SwiftHelper. All rights reserved.
//

import Foundation
import UIKit

class CSLocationTimer {
    
    static let sharedTimer = CSLocationTimer()
    var timer:Timer?
    
    /// start the time
    ///
    /// - Parameter interval: interval time //currently defined in constants
    func startTimerWithInterval(interval:TimeInterval){
      timer =  Timer.scheduledTimer(timeInterval: interval, target: CSLocationTimer.sharedTimer, selector: #selector(fetchLocation), userInfo: nil, repeats: true)
    }
    
    /// fetch user location from CSlocation manager class
    @objc func fetchLocation(){
    CSLocationManager.sharedLocation().startLocationUpdate()
    }
    
    
}
