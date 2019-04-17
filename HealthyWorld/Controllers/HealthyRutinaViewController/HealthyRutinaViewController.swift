//
//  HealthyRutinaViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 17/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HealthyRutinaViewController: UIViewController {
    
    let rightBarButtonItem: UIBarButtonItem = {
        let rightButton = UIBarButtonItem(title: "Siguiente", style: .plain, target: self, action: nil)
        rightButton.tintColor = .blue
        return rightButton
    }()
    
    
    
    let leftBarButtonItem: UIBarButtonItem = {
        let leftButton = UIBarButtonItem(title: "Atras", style: .plain, target: self, action: #selector(backToPrevView))
        leftButton.tintColor = .blue
        return leftButton
    }()

    @objc func backToPrevView() {
        navigationController?.show(HealthyMenuTabController(), sender: nil)
        
        
    }
    
    @IBOutlet weak var rutinaDetailView: RutinaDetailCustomView!
    
    public var selectedIndex:Int!
    
    public var texto:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemsBar()
        self.rutinaDetailView.labelDescription.text = texto
    
        //Controlar que celda se ha elegido para mostrar unos datos u otros
        
        // Do any additional setup after loading the view.
    }
    
    func setNavigationItemsBar() {
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        let image = UIImage(named: "nutricon")
        let imageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        
        
    }
    
    func setStackNavigation() {
        let detail = DetailRutinaPage1ViewController()
        let profile = HealthyProfileViewController()
        self.navigationController?.viewControllers = [detail,profile]
        
        
    }


  

}
