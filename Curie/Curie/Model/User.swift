//
//  User.swift
//  Curie
//
//  Created by Farhan on 4/2/19.
//  Copyright © 2019 Farhan Farooqui. All rights reserved.
//

import Foundation

class User:Codable {
    
    var id:Int?
    var firstName:String
    var lastName:String
    var email:String
    var type:String?
    var team_id:Int?
    var manager:String?
    var teamName:String?
    var joinCode:String?
    
    init(first:String, last:String, email:String) {
        self.firstName = first
        self.lastName = last
        self.email = email
    }
    
   
    
    
    
}
