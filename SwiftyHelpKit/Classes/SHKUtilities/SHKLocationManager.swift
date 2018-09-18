//
//  CSLocationManager.swift
//  SwiftHelper
//
//  Created by SwiftHelper on 8/9/18.
//  Copyright © 2018 SwiftHelper. All rights reserved.
//

import Foundation
import CoreLocation

typealias locationCompletion =  (_ userLatitude:Double,_ userLongtitude:Double,_ fullLocation:CLLocation) -> Void

class CSLocationManager: NSObject,CLLocationManagerDelegate {
    static  var csCLLocation =  CLLocationManager()
    static var  onLocationCom : locationCompletion? = nil
    
    private static var sharedLocationObject: CSLocationManager = {
        let locationObject = CSLocationManager()
        csCLLocation.delegate = locationObject
        csCLLocation.desiredAccuracy=kCLLocationAccuracyHundredMeters
        csCLLocation.distanceFilter = 200
//        csCLLocation.allowsBackgroundLocationUpdates = true
        csCLLocation.startUpdatingLocation()
//        csCLLocation.startMonitoringSignificantLocationChanges()
        return locationObject
    }()
    class func sharedLocation() -> CSLocationManager {
        return sharedLocationObject
    }
    func checkForAuthorization(completion:(_  isAuth:Bool)->Void) -> Void{
        switch( CLLocationManager.authorizationStatus() ){
        case .notDetermined:
            CSLocationManager.csCLLocation.requestAlwaysAuthorization()
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
    
    func startLocationTrack (completion:@escaping locationCompletion)->Void{
        CSLocationManager.onLocationCom = completion
        startLocationUpdate()
    }
    func startLocationUpdate(){
        CSLocationManager.csCLLocation.startUpdatingLocation()
//        LocationManager.csCLLocation.startMonitoringSignificantLocationChanges()
    }
    func stopLocationTrack() {
        CSLocationManager.csCLLocation.stopUpdatingLocation()
//        LocationManager.csCLLocation.stopMonitoringSignificantLocationChanges()
    }
    //MARK: location delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.firstObject as! CLLocation
        let coord = locationObj.coordinate
//         CSUserDefaults.sharedDefault.saveUserLocationDetails(location: locationObj)
         stopLocationTrack()
        if CSLocationManager.onLocationCom != nil {
            CSLocationManager.onLocationCom!(coord.latitude,coord.longitude,locationObj)
        }
    }
    
//    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
//        print("Resumed Tasks...")
//    }
//    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
//        print("Hello Testing testing")
//    }
}
