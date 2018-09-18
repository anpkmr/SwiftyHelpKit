//
//  SHKLocationfetchTimer.swift
//  SwiftyHelpKit
//
//  Created by SwiftyHelpKit on 8/9/18.
//  Copyright © 2018 SwiftyHelpKit. All rights reserved.
//

import Foundation
import UIKit

public class SHKLocationTimer {
    
    static let sharedTimer = SHKLocationTimer()
    var timer:Timer?
    
    /// start the time
    ///
    /// - Parameter interval: interval time //currently defined in constants
    func startTimerWithInterval(interval:TimeInterval){
      timer =  Timer.scheduledTimer(timeInterval: interval, target: SHKLocationTimer.sharedTimer, selector: #selector(fetchLocation), userInfo: nil, repeats: true)
    }
    
    /// fetch user location from SHKlocation manager class
    @objc func fetchLocation(){
    SHKLocationManager.sharedLocation().startLocationUpdate()
    }
    
    
}
