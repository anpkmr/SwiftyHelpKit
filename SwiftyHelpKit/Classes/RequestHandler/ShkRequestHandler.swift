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
    
    /// Create a post reqeust to the server with your reqeusted params
    ///
    /// - Parameters:
    ///   - requestUrl: Url of the reqeust (i.e. https://itunesconnect.topmovies/limt=25)
    ///   - requestParam: your requestParamDictinary
    ///   - completion: closure to return the response JSON and error if any
    public func postRequest(requestUrl:URL,requestParam:[String:Any]?,completion:@escaping (Any?,Error?)->Void) {
        Alamofire.request(requestUrl, method:.post, parameters: requestParam, encoding: URLEncoding.default, headers: nil).validate({ request, response, data in
            var errorMessage = ""
            if response.statusCode >= 200 && response.statusCode < 400 {
                return .success
            } else {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    if let json =  jsonResponse as? [String:Any] {
                        if let message =  json["message"] as? String {
                            errorMessage =  message
                        }else {
                            errorMessage = kJSONParsinError
                        }
                    } else {
                        errorMessage = kJSONParsinError
                    }
                    
                }
                catch let error {
                    print(error)
                    return .failure(error)
                }
            }
            return .failure(CSCustomError.myError(message:  errorMessage))
        }).responseJSON { (jsonResponse) in
            switch jsonResponse.result {
            case .success( _):
                completion(jsonResponse.result.value, nil)
                break
            case .failure(let reqError):
                completion(nil, reqError)
                break
            }
        }
    }
    /// Create a get reqeust to the server with your reqeuste params
    ///
    /// - Parameters:
    ///   - requestUrl: Url of the reqeust (i.e. https://itunesconnect.topmovies/limt=25)
    ///   - requestParam: your requestParamDictinary
    ///   - completion: closure to return the response JSON and error if any
    public func getRequest(requestUrl:URL,requestParam:[String:Any]?,completion:@escaping (Any?,Error?)->Void) {
        Alamofire.request(requestUrl, method:.get, parameters: requestParam, encoding: URLEncoding.default, headers: nil).validate({ request, response, data in
            var errorMessage = ""
            if response.statusCode >= 200 && response.statusCode < 400 {
                return .success
            } else {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    if let json =  jsonResponse as? [String:Any] {
                        if let message =  json["message"] as? String {
                            errorMessage =  message
                        }else {
                            errorMessage = kJSONParsinError
                        }
                    } else {
                        errorMessage = kJSONParsinError
                    }
                    
                }
                catch let error {
                    print(error)
                    return .failure(error)
                }
            }
            return .failure(CSCustomError.myError(message:  errorMessage))
        }).responseJSON { (jsonResponse) in
            switch jsonResponse.result {
            case .success( _):
                completion(jsonResponse.result.value, nil)
                break
            case .failure(let reqError):
                completion(nil, reqError)
                break
            }
        }
    }
    
}

class CSCustomError:Error {
    class func myError(message:String)->Error{
        return NSError(domain: kAppBundleId, code: 400, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
    
}
