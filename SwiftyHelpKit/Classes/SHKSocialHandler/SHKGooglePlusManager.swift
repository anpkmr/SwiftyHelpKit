//
//  GoogleManager.swift
//  SwiftyHelpKit
//
//  Created by SwiftyHelpKit on 8/28/18.
//  Copyright © 2018 SwiftyHelpKit. All rights reserved.
//


import Foundation
import UIKit
import GoogleSignIn
import ObjectMapper

public typealias  socialuserDetailComletion = (_ userDetail:SocialUser?,_ err:Error?)->Void

public class SHKGooglePlusManager: NSObject,GIDSignInDelegate,GIDSignInUIDelegate {
    //MARK:- varible Declaration
   var googleUserCompletionhandler:socialuserDetailComletion? = nil
    //    var googleLoggedUserObserver  = Observable.create(λ)
    private var onViewController:UIViewController?
    
    //MARK:- Shared instance created
   public static var sharedGoogleClient: SHKGooglePlusManager = {
        let sharedGoogleObject = SHKGooglePlusManager()
        GIDSignIn.sharedInstance().delegate = sharedGoogleObject
        GIDSignIn.sharedInstance().uiDelegate = sharedGoogleObject
        return sharedGoogleObject
    }()
    
    //MARK:- Googlemanager startup method
   public  func setupGoogleLogin(_ viewController:UIViewController,completion:@escaping socialuserDetailComletion) {
        onViewController = viewController
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().signIn()
        googleUserCompletionhandler  = completion
    }
    
    //MARK:Google signIn delegate
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        createGoogleUserDict(user:  user,error: error)
    }
    
    // Present a view that prompts the user to sign in with Google
   public func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        onViewController?.present(viewController, animated: true,completion: nil)
    }
    // Dismiss the "Sign in with Google"
   public func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        onViewController?.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Other methods
    ///Create user dictionary to post on server
    ///
    /// - Parameters:
    ///   - user: user Object i.e GIDGoogleUser
    ///   - error: Error
   public func createGoogleUserDict(user:GIDGoogleUser?,error:Error?) {
        if error == nil {
            let googleLoginParam = ["email":(user?.profile.email)!,"first_name":(user?.profile.givenName)!,"last_name":(user?.profile.familyName)!,"social_id":user?.userID!] as [String:Any]
             let user : SocialUser? = Mapper<SocialUser>().map(JSON: googleLoginParam)
            googleUserCompletionhandler!(user,nil)
        } else {
            googleUserCompletionhandler!(nil,error)
        }
    }
    /// Logout user from google plus
   public func logoutFromGoogle(){
        GIDSignIn.sharedInstance().signOut()
    }
    
}
