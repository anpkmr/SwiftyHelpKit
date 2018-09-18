//
//  SHKLocationManager.swift
//  SwiftyHelpKit
//
//  Created by SwiftyHelpKit on 8/9/18.
//  Copyright © 2018 SwiftyHelpKit. All rights reserved.
//

import Foundation
import CoreLocation

public typealias locationCompletion =  (_ userLatitude:Double,_ userLongtitude:Double,_ fullLocation:CLLocation) -> Void

public class SHKLocationManager: NSObject,CLLocationManagerDelegate {
    static var shkCLLocationObject =  CLLocationManager()
    static var  onLocationCom : locationCompletion? = nil

    private static var sharedLocationObject: SHKLocationManager = {
        let locationObject = SHKLocationManager()
        shkCLLocationObject.delegate = locationObject
        shkCLLocationObject.desiredAccuracy=kCLLocationAccuracyHundredMeters
        shkCLLocationObject.distanceFilter = 200
//        csCLLocation.allowsBackgroundLocationUpdates = true
        shkCLLocationObject.startUpdatingLocation()
//        csCLLocation.startMonitoringSignificantLocationChanges()
        return locationObject
    }()
    
    public class func sharedLocation() -> SHKLocationManager {
        return sharedLocationObject
    }
    public func checkForAuthorization(completion:(_  isAuth:Bool)->Void) -> Void{
        switch( CLLocationManager.authorizationStatus() ){
        case .notDetermined:
            SHKLocationManager.shkCLLocationObject.requestAlwaysAuthorization()
            completion(true)
            break
        case .authorizedAlways , .authorizedWhenInUse:
            completion(true)
            break
        case .denied:
            completion(false)
        default:
            break
        }
    }
    
    public func startLocationTrack (completion:@escaping locationCompletion)->Void{
        SHKLocationManager.onLocationCom = completion
        startLocationUpdate()
    }
   public func startLocationUpdate(){
        SHKLocationManager.shkCLLocationObject.startUpdatingLocation()
//        LocationManager.csCLLocation.startMonitoringSignificantLocationChanges()
    }
    public func stopLocationTrack() {
        SHKLocationManager.shkCLLocationObject.stopUpdatingLocation()
//        LocationManager.csCLLocation.stopMonitoringSignificantLocationChanges()
    }
    //MARK: location delegate
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.firstObject as! CLLocation
        let coord = locationObj.coordinate
         stopLocationTrack()
        if SHKLocationManager.onLocationCom != nil {
            SHKLocationManager.onLocationCom!(coord.latitude,coord.longitude,locationObj)
        }
    }
    
//    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
//        print("Resumed Tasks...")
//    }
//    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
//        print("Hello Testing testing")
//    }
}
