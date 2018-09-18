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
        ShkRequestHandler.sharedService.getRequest(requestUrl: URL(string:"https://itunes.apple.com/us/rss/topmovies/limit=25/json")!, requestParam: nil) { (response, error) in
            if error == nil {
                print("Response in my controller class is ===\(String(describing: response))")
            } else {
                print("Error in request is ===\(String(describing: error?.localizedDescription))")
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

