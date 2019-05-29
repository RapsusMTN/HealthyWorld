//
//  HealthyMenuTabController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 16/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation
import UIKit
import SwiftSpinner

class HealthyMenuTabController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Crea el menu de rutinas
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let rutinaController = RutinasCollectionViewController(collectionViewLayout: layout)
        let rutinasNav = UINavigationController(rootViewController: rutinaController)
        rutinasNav.tabBarItem.title = "Rutinas"
        rutinasNav.tabBarItem.image = UIImage(named: "iconPeso")
        
        //Crea el menu perfil
        let perfilController = MiPerfilViewController()
        let perfilNavController = UINavigationController(rootViewController: perfilController)
        perfilNavController.tabBarItem.title = "Mi Perfil"
        perfilNavController.tabBarItem.image = UIImage(named: "iconName")
        
        //Crea el menu dietas
        let vc = isDietaCreated()
        
        //Crea el menu ARHealthy
        let arcontroller = HealthyARViewController()
        let navigationAR = UINavigationController(rootViewController: arcontroller)
        navigationAR.tabBarItem.title = "AR Healthy"
        navigationAR.tabBarItem.image = UIImage(named: "iconAge")
        
        viewControllers = [perfilNavController,vc,rutinasNav,navigationAR]
        
      
        
    }
    
    //Creo el cada navController
    private func createNavController(title: String, imageName:String) -> UINavigationController {
        
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
        
        
        
    }
    
    func isDietaCreated() -> UIViewController {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "arrayAlimentos") != nil {
            let vc = HealthyDietaCreadaViewController()
            vc.tabBarItem.title = "Dietas"
            vc.tabBarItem.image = UIImage(named: "food")
            return vc
        }else {
            let dietaController = HealthyDietaTableViewController()
            let dietaNav = UINavigationController(rootViewController: dietaController)
            dietaNav.tabBarItem.title = "Dietas"
            dietaNav.tabBarItem.image = UIImage(named: "food")
            return dietaNav
        }
    }
    
    
    
    
}
