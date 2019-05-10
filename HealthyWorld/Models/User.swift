//
//  User.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 15/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation

public class User: Codable {
    
    static var idUser:Int = 0
    
    var username:String?
    
    var age:String?
    
    var weight:String?
    
    var genre:String?
    
    var height:String?
    
    var objective:String?
    
    static func createUniqueId() {
        idUser += 1
    }
    
    
}
