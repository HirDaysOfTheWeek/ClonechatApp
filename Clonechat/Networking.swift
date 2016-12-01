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

    class func register(userId : String, email : String, password : String, completionHandler: @escaping (NSDictionary?, NSError?) -> ()) {
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
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
            })
    }
    
    class func login(userId : String, password : String, completionHandler: @escaping (NSDictionary?, NSError?) -> () ) {
        let loginUrl = Networking().url! + "/users/login"
        let parameters : Parameters = [
            "username" : userId,
            "password" : password
        ]
        Alamofire.request(loginUrl, method: .post, parameters: parameters).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                completionHandler(value as? NSDictionary, nil)
            case .failure(let error):
                completionHandler(nil, error as NSError?)
            }
        }
    }
    
   
    
    
}
