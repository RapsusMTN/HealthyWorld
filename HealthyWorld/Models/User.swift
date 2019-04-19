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
    
    private var _username:String?
    
    var username:String {
        set {
            _username = newValue
        }
        get{
            return _username!
        }
    }
    
    private var _age:String?
    var age:String {
        get{
            return _age!
        }
        set{
            _age = newValue
        }
    }
    
    private var _weight:String?
    var weight:String {
        get{
            return _weight!
        }
        set{
            _weight = newValue
        }
    }
    
    private var _genre:String?
    var genre:String {
        get{
            return _genre!
        }
        set {
            _genre = newValue
        }
        
    }
    
    private var _height:String?
    var height:String {
        get {
            return _height!
        }
        set {
            _height = newValue
        }
    }
    
    private var _objective:String?
    var objective:String {
        get {
            return _objective!
        }
        set {
            _objective = newValue
        }
        
        
    }
    
    init(_ nombre: String,_ edad:String,_ peso:String,_ altura:String,_ sexo:String,_ objetivo:String) {
        self.username = nombre
        self.age = edad
        self.weight = peso
        self.height = altura
        self.genre = sexo
        self.objective = objetivo
        User.createUniqueId()
        
        
    }
    
    init() {
        
    }
    
    static func createUniqueId() {
        idUser += 1
    }
    
    
}
