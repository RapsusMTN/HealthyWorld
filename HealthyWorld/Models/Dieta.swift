//
//  Dieta.swift
//  HealthyWorld
//
//  Created by Jorge Martín on 10/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation

public class Dieta:NSObject {
    
    public var idDieta:Int!
    
    private var comidas:[String]!
    
    var _comidas:[String] {
        get{
             return comidas
        }
        set{
            comidas = newValue
        }
    }
    
    init(comida:[String]) {
        super.init()
        self.comidas = comida
    }
    
    
    
    
    
    
    
}
