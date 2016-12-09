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

class PostSnapResponse: Mappable {
    var status: String?
    var message: String?
    var snap: Snap?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        snap <- map["snap"]
    }
}

class RetrieveSnapResponse: Mappable {
    var status: String?
    var message: String?
    var snaps: [Snap]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        snaps <- map["snaps"]
    }
}

class Snap: Mappable {
    var picture: Data?
    var sentDate: Date?
    var opened: Bool?
    var recipient: String?
    var sender: String?
    var ycoordinate: Double?
    var caption: String?
    var showLength: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        picture <- map["picture"]
        sentDate <- map["sentDate"]
        opened <- map["opened"]
        recipient <- map["recipient"]
        sender <- map["sender"]
        ycoordinate <- map["ycoordinate"]
        caption <- map["caption"]
        showLength <- map["showLength"]
    }
}


