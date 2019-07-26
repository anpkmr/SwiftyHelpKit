//
//  ShkNetworkListner.swift
//  Alamofire
//
//  Created by anoop on 26/07/19.
//

import Foundation
import Alamofire

//MARK:- Network listining
public class ShkNetworkLister {
    /// Listen to network cahnges
   static let reachabilityManager = NetworkReachabilityManager()
    static var appNetworkAvail = true
   public class func networkListening(){
        ShkNetworkLister.reachabilityManager?.startListening()
        ShkNetworkLister.reachabilityManager?.listener = { _ in
            self.appNetworkAvail = (self.reachabilityManager?.isReachable)!
        }
    }
}

