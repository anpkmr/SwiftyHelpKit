//
//  ShkRequestHandler.swift
//  Pods-SwiftyHelpKit_Example
//
//  Created by anoop on 9/18/18.
//

import Foundation
import Alamofire



public class ShkRequestHandler: NSObject {
    public static let sharedService = ShkRequestHandler()
    public static var basicToken = ""
    public static var requestTimeOut = 60.0
    let sharedSession: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = requestTimeOut
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
    let sessionManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
    
    /// Create a  reqeust to the server with your requested params
    ///
    /// - Parameters:
    ///   - method: post,get,put,delete
    ///   - requestUrl: Url of the reqeust (i.e. https://itunesconnect.topmovies/limt=25)
    ///   - validateResonse: perform the validation in if need to check for status/message key or not
    ///   - requestParam: your requestParamDictinary
    ///   - completion: closure to return the response JSON and error if any
    public func createApiRequest(_ method:HTTPMethod,requestUrl:URL,validateResonse:Bool = true,requestParam:[String:Any]?,completion:@escaping (Any?,Error?)->Void) {
        print("Reqeust URL is ==== \(requestUrl) with param is ==== \(String(describing: requestParam))==\(self.addHeaders())")
        if ShkNetworkLister.appNetworkAvail {
            DispatchQueue.global(qos: .background).async {
                self.sharedSession.request(requestUrl, method:method, parameters: requestParam, encoding: URLEncoding.default, headers: self.addHeaders()).validate({ request, response, data in
                    var errorMessage = ""
                    if response.statusCode >= 200 && response.statusCode < 400 {
                        return .success
                    } else {
                        do {
                            let jsonObj = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                            print("JSON OBJECT FROM SERVER IS\n\n \(jsonObj)")
                            errorMessage = self.getErrorMessage(jsonResponse: jsonObj)
                        }
                        catch let error {
                            print(error)
                            return .failure(error)
                        }
                    }
                    return .failure(ShkCustomError.createError(message:  errorMessage))
                }).responseJSON { (jsonResponse) in
                    DispatchQueue.main.async {
                        switch jsonResponse.result {
                        case .success( _):
                            print("success JSON IS ===\(String(describing: jsonResponse.result.value))")
                            let (isValid,errMsg) = self.validateResponse(jsonResponse: jsonResponse.result.value,isValidate: validateResonse)
                            
                            if isValid {
                                completion(jsonResponse.result.value, nil)
                            } else {
                                completion(nil, ShkCustomError.createError(message:  errMsg!))
                            }
                        case .failure(let reqError):
                            print("reqError JSON IS ===\(reqError.localizedDescription)")
                            completion(nil, reqError)
                        }
                    }
                }
            }
        } else  {
            completion(nil, ShkCustomError.createError(message:  kNoInternetConnection))
        }
        
    }
    
    /// get error message for the response if it is no a success case
    ///
    /// - Parameter jsonResponse: json response
    /// - Returns: error message string
    func getErrorMessage(jsonResponse:Any?)->String {
        if let json =  jsonResponse as? [String:Any] {
            if let message =  json["message"] as? String {
                return message
            }else {
                return kJSONParsinError
            }
        }
        return kJSONParsinError
    }
    
    /// validate response for message/status keys.
    ///
    /// - Parameters:
    ///   - jsonResponse: reponse JSON in Dict form
    ///   - isValidate: if validate is true validate for status key and if false return true.
    /// - Returns: (true,nil) and (false,errorMessage)
    func validateResponse(jsonResponse:Any?,isValidate:Bool) ->(Bool,String?) {
        guard isValidate == true else {
            return (true,nil)
        }
        if jsonResponse != nil, let json =  jsonResponse as? [String:Any] {
            if let status = json["status"] as? Int{
                if status == kAPIStatusSuccess {
                    return (true,nil)
                }
                return (false,getErrorMessage(jsonResponse:jsonResponse))
            }
            return (false,getErrorMessage(jsonResponse:jsonResponse))
        }
        return (false,kJSONParsinError)
    }
    
    
    /// add headers to the request. If user is logged into the app return the header with saved access token if not returnt with default token.
    ///
    /// - Returns: [stirng:string] format header.
    func addHeaders()->[String:String]{
        if let accessToken = SHKUserDefaults.sharedDefault.getSavedToken(){
            print("access token is \(accessToken)")
            return ["Authorization":accessToken,
                    "Accept": "application/json"
            ]
        }
        return ["Accept": "application/json","Content-Type":"application/x-www-form-urlencoded","Authorization":ShkRequestHandler.basicToken]
    }
}

class ShkCustomError:Error {
    class func createError(message:String)->Error{
        return NSError(domain: kAppBundleId, code: 400, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
    
}
