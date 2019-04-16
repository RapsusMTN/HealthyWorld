//
//  User.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 15/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation

class User {
    
    static var idUser:Int = 0
    
    private let username:String!
    
    private var age:Int!
    
    private let weight:Double!
    
    private let genre:String!
    
    private let height:Double!
    
    init(_ nombre: String,_ edad:Int,_ peso:Double,_ altura:Double,_ sexo:String) {
        self.username = nombre
        self.age = edad
        self.weight = peso
        self.height = altura
        self.genre = sexo
        User.createUniqueId()
       
        
    }
    
    init() {
        self.username = nil
        self.age = nil
        self.weight = nil
        self.height = nil
        self.genre = nil
        
    }
    
    static func createUniqueId() {
        idUser += 1
    }
    
    
}