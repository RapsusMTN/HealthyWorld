//
//  HealthyProfileViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 15/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HealthyProfileViewController: UIViewController {
    
    //Returns the specific viewController
    static func initAndLoad() -> UIViewController {
        let profileViewController: HealthyProfileViewController = HealthyProfileViewController(nibName: "HealthyProfileViewController", bundle: nil)
        return profileViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigation = UINavigationController(rootViewController: HealthyProfileViewController.initAndLoad())
        navigation.isNavigationBarHidden = false
    
    
        
        
        
    }
    
    

    
    

}
