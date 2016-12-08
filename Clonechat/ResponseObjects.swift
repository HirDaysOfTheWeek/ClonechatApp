//
//  ResponseObjects.swift
//  Clonechat
//
//  Created by Shreyas Hirday on 12/8/16.
//  Copyright © 2016 HirDaysOfTheWeek. All rights reserved.
//

import Foundation
import ObjectMapper

class AuthenticationResponse: Mappable {
    var status: String?
    var message: String?
    var user: User?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        user <- map["user"]
    }
}

class User: Mappable {
    var username: String?
    var email: String?
    var cloneScore: Int?
    var new: Bool?
    var createdAt: Date?
    var updatedAt: Date?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        username <- map["username"]
        email <- map["email"]
        cloneScore <- map["cloneScore"]
        new <- map["new"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
    }
}
