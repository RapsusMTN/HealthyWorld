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
        
        viewControllers = [perfilNavController,createNavController(title: "Dietas", imageName: "iconEstatura"),rutinasNav,createNavController(title: "AR Healthy", imageName: "iconAge")]
        
       //Crea el menu dietas
        
        
    }
    
    //Creo el cada navController
    private func createNavController(title: String, imageName:String) -> UINavigationController {
        
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
        
        
        
    }
    
    
    
    
}
