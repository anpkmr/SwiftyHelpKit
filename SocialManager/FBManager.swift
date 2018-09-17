//
//  FacebookManager.swift
//  SwiftHelper
//
//  Created by SwiftHelper on 8/28/18.
//  Copyright © 2018 SwiftHelper. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FBSDKCoreKit
import ObjectMapper
import UIkit

class FBManager: NSObject {
    var loginVC : FBSDKLoginManager? = nil
    private static var sharedFB: FBManager = {
        let sharedFacebook = FBManager()
        return sharedFacebook
    }()
    
    /// shared method
    ///
    /// - Returns: self object
    class func  sharedFBService() -> FBManager {
        return sharedFB
    }
    /// Check if a valid access token is available or not..
    ///
    /// - Returns: true/false
    func isConnectedToFB() -> Bool {
        if FBSDKAccessToken.current() != nil &&  hasGrantedPermission() == true{
            return true
        }
        return false
    }
    
    /// check if we have the all granted permission in our app like public_profile, email, user_friends
    ///
    /// - Returns: true/false
    func hasGrantedPermission()-> Bool{
        if     FBSDKAccessToken.current().hasGranted("public_profile") &&  FBSDKAccessToken.current().hasGranted("email") &&  FBSDKAccessToken.current().hasGranted("user_friends"){
            return true
        }
        return false
    }
    
    /// log in user if no valid accesstoken found for fb session
    ///
    /// - Parameters:
    ///   - presentOnVC: ViewController on which you wan to present the facebook login screen
    ///   - completion: if login is successfull or not comletion block
    func  loginTofacebook(presentOnVC:UIViewController!,completion:@escaping ((Bool,Error?)->Void))  {
        if loginVC == nil {
            loginVC = FBSDKLoginManager()
        }
            self.loginVC?.logIn(withReadPermissions: ["public_profile", "email", "user_friends"], from: presentOnVC) { (result, error) in
                if error != nil{
                   completion(false,error)
                    return
                }
                if (result?.isCancelled) == true{
                   completion(false,nil)
                } else {
                   completion(true,nil)
                }
            }
    }
   
   
    /// Fetch user data if user is logged in or access token is available.
    ///
    /// - Parameter fbUserDetailCompletion: comletion bloc that will return the user details
    func fetchUseData(fbUserDetailCompletion:@escaping (SocialUser?,Error?)->Void){
        
            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name,first_name,last_name,gender,picture.type(large)"])
            graphRequest.start(completionHandler: { (connection, result, error) -> Void in
                if ((error) == nil) {
                    if let fbResult = result as? [String:Any]{
                        if let _ = fbResult["email"]{
                            let user : SocialUser? = Mapper<SocialUser>().map(JSON: fbResult )
                            fbUserDetailCompletion(user, nil)
                        }else {
                            fbUserDetailCompletion(nil, NSError.init(domain: Bundle.main.identifier!, code: 400, userInfo: ["msg":"Email Not found"]))
                        }
                    }
                }
                else {
                    fbUserDetailCompletion(nil, error)
                }
            })
        
    }
    
    /// log out from facebook
    func facebookLogOut()->Void{
        if loginVC != nil{
            loginVC?.logOut()
        }
        FBSDKAccessToken.setCurrent(nil)
        FBSDKProfile.setCurrent(nil)
    }
}
