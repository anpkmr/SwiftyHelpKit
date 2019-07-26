//
//  ViewController.swift
//  SwiftyHelpKit
//
//  Created by anpkmr on 09/17/2018.
//  Copyright (c) 2018 anpkmr. All rights reserved.
//

import UIKit
import SwiftyHelpKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- IBActions
    
    @IBAction func faceBookLogin(_ sender:UIButton){
        facebookLogin()
    }
    
    @IBAction func fetchTopMovies(_ sender:UIButton) {
        
        ShkRequestHandler.sharedService.createApiRequest(.post, requestUrl: URL(string:"https://itunes.apple.com/us/rss/topmovies/limit=25/json")!, requestParam: nil) { (response, error) in
            if error == nil {
                print("Response in my controller class is ===\(String(describing: response))")
            } else {
                print("Error in request is ===\(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @IBAction func buttonGooglePlusTapped(_ sender: Any) {
        SHKGooglePlusManager.sharedGoogleClient.setupGoogleLogin(self) { (socialUser, error) in
            guard error == nil else {
                print("SOcial user is====\(String(describing: socialUser?.firstName))")
                return
            }
        }
    }
    @IBAction func showConfirmationAlert(_ sender: Any) {
        showConfirmationAlert(alertText: "This is a confrimation alert",okayMessage:"Delete?", okayActionStyle: .destructive) { (buttonAction) in
            switch buttonAction! {
            case .Ok:
                print("do some action button tapped")
                break
            case .Cancel:
                print("Cancel tapped")
                break
            }
        }
    }
    
    @IBAction func showSimpleAlert(_ sender: Any) {
        showSimpleAlert(message: "Simple alert")
    }
    @IBAction func showImageAction(_ sender:Any){
        
        showActionSheetForImagePick { (image) in
            if image != nil {
                self.imageView.image = image
            }
        }
    }
    
    
    
    /// Facebook Login
    
    func facebookLogin(){
        switch SHKFBManager.sharedFBService().isConnectedToFB()  {
        case .Valid:
            SHKFBManager.sharedFBService().fetchUseData(fbUserDetailCompletion: { (userInfo, error) in
                print("Logged user is ===\(String(describing: userInfo))")
            })
            break
        case .Invalid(let notConenctedErrorMessage):
            print("Error is ===\(notConenctedErrorMessage)")
            SHKFBManager.sharedFBService().loginTofacebook(presentOnVC: self, completion: { (isLoggedIn, error) in
                guard isLoggedIn == false else {
                    SHKFBManager.sharedFBService().fetchUseData(fbUserDetailCompletion: { (userInfo, error) in
                        print("Logged user is ===\(String(describing: userInfo))")
                    })
                    return
                }
                print("Error in login is ===\(String(describing: error?.localizedDescription))")
            })
        }
    }
    
}

