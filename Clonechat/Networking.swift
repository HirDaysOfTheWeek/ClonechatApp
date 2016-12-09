//
//  Networking.swift
//  Hawk
//
//  Created by Shreyas Hirday on 11/12/16.
//  Copyright © 2016 HirDaysOfTheWeek. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Networking {
    
    var url: String? {
        return "http://localhost:3000"
    }

    class func register(userId : String, email : String, password : String, completionHandler: @escaping (AuthenticationResponse?, NSError?) -> ()) {
        let registerUrl = Networking().url! + "/users/register"
        Alamofire.upload(multipartFormData: {multipartFormData in
            multipartFormData.append(userId.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName : "username")
            multipartFormData.append(email.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName : "email")
            multipartFormData.append(password.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName : "password")
            
        }
            , to: registerUrl, encodingCompletion:
                { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseObject { (response: DataResponse<AuthenticationResponse>) in
                        switch response.result {
                        case .success(let value):
                            completionHandler(value as AuthenticationResponse, nil)
                        case .failure(let error):
                            completionHandler(nil, error as NSError?)
                        }
                    }
                case .failure(let encodingError):
                    completionHandler(nil, encodingError as NSError?)
                }
            })
    }
    
    class func login(userId : String, password : String, completionHandler: @escaping (AuthenticationResponse?, NSError?) -> () ) {
        let loginUrl = Networking().url! + "/users/login"
    
        Alamofire.upload(multipartFormData: {multipartFormData in
            multipartFormData.append(userId.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName : "username")
            multipartFormData.append(password.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName : "password")
            
        }
            , to: loginUrl, encodingCompletion:
            { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseObject { (response: DataResponse<AuthenticationResponse>) in
                        switch response.result {
                        case .success(let value):
                            completionHandler(value as AuthenticationResponse, nil)
                        case .failure(let error):
                            completionHandler(nil, error as NSError?)
                        }
                    }
                case .failure(let encodingError):
                    completionHandler(nil, encodingError as NSError?)
                }
        })
    }
    
    class func postSnap(image: NSData, username: String, recipient: String, ycoordinate: Double, caption: String, showLength: Int, completionHandler: @escaping(PostSnapResponse?, NSError?) ->()) {
        
        let postSnapUrl = Networking().url! + "/snaps/postSnap"
        
        Alamofire.upload(multipartFormData: {multipartFormData in
            multipartFormData.append(username.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: "username")
            multipartFormData.append(recipient.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: "recipient")
            multipartFormData.append(caption.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: "caption")
            var value = ycoordinate
            let data = withUnsafePointer(to: &value) {
                Data(bytes: UnsafePointer($0), count: MemoryLayout.size(ofValue: ycoordinate))
            }
            multipartFormData.append(data, withName: "ycoordinate")
            var value2 = showLength
            let data2 = withUnsafePointer(to: &value2) {
                Data(bytes: UnsafePointer($0), count: MemoryLayout.size(ofValue: showLength))
            }
            multipartFormData.append(data2, withName: "showLength")
            let imageData = image.subdata(with: NSRange())
            multipartFormData.append(imageData, withName: "snapPhoto")
        }
            ,to: postSnapUrl,
             encodingCompletion: {encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseObject { (response: DataResponse<PostSnapResponse>) in
                switch response.result {
                case .success(let value):
                    completionHandler(value as PostSnapResponse, nil)
                case .failure(let error):
                    completionHandler(nil, error as NSError?)
                }
            }
            case .failure(let encodingError):
                completionHandler(nil, encodingError as NSError?)
            }
            
        })
    }
    
    class func getSnapByUserId(username: String, completionHandler: @escaping(RetrieveSnapResponse?, NSError?) ->()) {
        
        let getSnapByUserIdUrl = Networking().url! + "/snaps/getSnapsByUserId"
        Alamofire.upload(multipartFormData: {multipartFormData in
            multipartFormData.append(username.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: "username") }, to: getSnapByUserIdUrl, encodingCompletion: {encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseObject { (response: DataResponse<RetrieveSnapResponse>) in
                    switch response.result {
                    case .success(let value):
                        completionHandler(value as RetrieveSnapResponse, nil)
                    case .failure(let error):
                        completionHandler(nil, error as NSError?)
                    }
                }
            case .failure(let encodingError):
                completionHandler(nil, encodingError as NSError?)
            }
            
        })
        
    }
    
    
}
