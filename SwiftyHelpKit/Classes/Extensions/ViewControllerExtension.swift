//
//  ViewControllerExtension.swift
//  SwiftyHelpKit
//
//  Created by SwiftyHelpKit on 9/20/18.
//  Copyright SwiftyHelpKit. All rights reserved.
//

import Foundation
import UIKit
import Photos
import UserNotifications


public typealias imageCompletion = (_ image: UIImage?)->Void

public enum Action {
    case Ok
    case Cancel
}


private let imagePicker = UIImagePickerController()
private var myImageCom : imageCompletion? = nil


extension UIViewController :UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    /// clear all the textFields inside a view
    ///
    /// - Parameter view: Your view of that has collectiono of textFields
    public func clearAllFields(_ view:UIView){
        for textField in view.subviews{
            if textField is UITextField {
                (textField as! UITextField).text = nil
            }
        }
    }
    
    /// showAlert for the confirmation with some defautl values
    ///
    /// - Parameters:
    ///   - mytext: your message text
    ///   - dismissTitle: dismiss button title
    ///   - completion: completion
    public func showAlert(mytext: String,dismissTitle:String = kDismiss, completion: (() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: kAppTitle, message: mytext, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: dismissTitle, style: UIAlertActionStyle.default, handler: { (action) in
            if completion != nil{
                completion!()
            }
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /// show a simple alert without any completion block to  returnt to caller class
    ///
    /// - Parameter message: message to show on alert controller
    public func showSimpleAlert(message: String!) {
        let alertController = UIAlertController(title: kAppTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: kDismiss, style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    public func showConfirmationAlert(alertText: String, okayMessage:String = kLogoutConfirm,okayActionStyle:UIAlertActionStyle , completion: @escaping (_ alertAction : Action?) ->()) {
        let alert = UIAlertController(title: kAppTitle, message: alertText, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: kCancel, style: UIAlertActionStyle.default, handler: { (action) in
            completion(.Cancel)
            
        }))
        
        alert.addAction(UIAlertAction(title:okayMessage , style: okayActionStyle, handler: { (action) in
            completion(.Ok)
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    public func showActionSheetForImagePick(isVideoRequired: Bool = false,pickImageComletion: @escaping imageCompletion){
        let alertController = UIAlertController(title: kAppTitle, message: kChooseImage, preferredStyle: .actionSheet)
        let cameraAlertAction = UIAlertAction(title: kCameraTypePhoto, style: .default) { (action) in
            self.getImage(sourceType: .camera, completion: pickImageComletion)
        }
        let photoAlertAction = UIAlertAction(title: kCameraTypeGallery, style: .default) { (action) in
            self.getImage(sourceType: .photoLibrary, completion: pickImageComletion )
        }
        let cancelAction = UIAlertAction(title: kCancel, style: .cancel) { (action) in
            self.dismiss(animated: true, completion:nil)
        }
        if isVideoRequired == true{
            let videoAlertAction = UIAlertAction(title: kCameraTypeVideo, style: .default) { (action) in
                self.getImage(sourceType: .camera, captureMode: .video, completion: pickImageComletion)
            }
            alertController.addAction(videoAlertAction)
        }
        alertController.addAction(cameraAlertAction)
        alertController.addAction(photoAlertAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    public func getImage(sourceType: UIImagePickerControllerSourceType,captureMode:UIImagePickerControllerCameraCaptureMode = .photo,completion: @escaping imageCompletion) {
        myImageCom = completion
        imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(sourceType) == true {
            imagePicker.sourceType = sourceType
            if sourceType == .camera {
                imagePicker.cameraCaptureMode = captureMode
            }
            imagePicker.delegate = self
            //            imagePicker.navigationBar.barTintColor = kNavigationColor
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            //FIXME: Show alert that not available
        }
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            myImageCom!(pickedImage)
        }
        dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) {
            if myImageCom != nil {
                myImageCom!(nil)
            }
        }
    }
    
    @IBAction func pop(_ sender:UIButton){
        navigationController?.popViewController(animated: false)
    }
    
    public func addTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
    }
    // function which is triggered when handleTap is called
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
}
