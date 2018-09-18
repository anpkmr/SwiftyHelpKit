
//  Created by anoop on 8/7/18.
//  Copyright © 2018 ios. All rights reserved.
//

import Foundation
import ObjectMapper



class SHKUserDefaults : NSObject{
    
    static let sharedDefault = SHKUserDefaults()//Singletion object
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
    
    
    /// remove user info from defaults
    func removeSavedUser(){
        defaults.removeObject(forKey:kUDUserInfoKey)
        defaults.removeObject(forKey:"loginPin")
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

