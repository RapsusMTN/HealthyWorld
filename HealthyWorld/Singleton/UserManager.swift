//
//  UserManager.swift
//  HealthyWorld
//
//  Created by Jorge Martín on 10/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation


class UserManager {
    
    static let kUserDefaultsKey: String = "kUserDefaultsKey"

    static let instance = UserManager()
    
    public func saveUser(user:User, key:String)
    {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
        UserDefaults.standard.synchronize()
    }
    
    public func getUser(key:String) -> User
    {
        if let userData = UserDefaults.standard.data(forKey: key),
            let user = try? JSONDecoder().decode(User.self, from: userData) {
            return user
        }
        
        return User()
    }
    
    
}
