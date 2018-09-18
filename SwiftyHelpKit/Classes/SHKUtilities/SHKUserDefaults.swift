//
//  CSUserDefaults.swift
//  Caldersafe
//
//  Created by anoop on 8/7/18.
//  Copyright © 2018 ios. All rights reserved.
//

import Foundation
import ObjectMapper



class CSUserDefaults : NSObject{
    
    static let sharedDefault = CSUserDefaults()//Singletion object
    let defaults = UserDefaults.standard//userDefault object
    

    /// save userInfo
    ///
    /// - Parameter info: userObject
    func saveUserInfo(info:SocialUser?) {
        guard info == nil else {
            let JSONString = Mapper().toJSONString(info!, prettyPrint: true)
            defaults.set(JSONString, forKey: kUDUserInfoKey)
            defaults.synchronize()
            return
        }
    }
    
    /// get UserInfo
    ///
    /// - Returns: userObject
    func getSaveUserInfo() -> SocialUser? {
        let   userSecretObject =   defaults.value(forKey: kUDUserInfoKey) as? String
        guard userSecretObject == nil
            else {
                var user = SocialUser()
                user = Mapper<SocialUser>().map(JSONString: userSecretObject!)!
                return user
        }
        return nil
    }
    
    /// save user pin to userDefaults
    ///
    /// - Parameters:
    ///   - loginPin: pin
    ///   - forType: supervisor/operator
    func savePin(loginPin:String,forType:String){
        defaults.set(loginPin, forKey: forType)
        defaults.synchronize()
    }
    func getPin(forType:String)->String?{
         return defaults.value(forKey:forType) as? String
    }
    func saveModule(name:String){
        defaults.set(name, forKey: kUDModuleKey)
        defaults.synchronize()
    }
    func getModule()->String? {
        return defaults.value(forKey:kUDModuleKey) as? String
    }
    func removeModule() {
        defaults.removeObject(forKey: kUDModuleKey)
        defaults.synchronize()
    }
    
    
    /// remove user info from defaults
    func removeSavedUser(){
        defaults.removeObject(forKey:kUDUserInfoKey)
        defaults.removeObject(forKey:kUDfirstTimeLoginKey)
        defaults.removeObject(forKey:"loginPin")
        defaults.removeObject(forKey:kUDModuleKey)
        defaults.synchronize()
    }
    
    func isloggedInFirstTime(isLoginFirst:Bool){
        defaults.set(isLoginFirst, forKey: "firstTimeLogged")
        defaults.synchronize()
    }

    func getloggedInFirstTime() -> Bool?{
        return defaults.value(forKey:"firstTimeLogged") as? Bool
    }
}

