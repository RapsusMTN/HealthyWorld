//
//  HealthyRutinaViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 17/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HealthyRutinaViewController: UIViewController {
    
    @IBOutlet weak var rutinaDetailView: RutinaDetailCustomView!
    
    public var selectedIndex:Int!
    
    public var texto:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemsBar()
        self.rutinaDetailView.labelDescription.text = texto
        //Lo mismo que en la otra vista y dissmis para ir atras
        //Controlar que celda se ha elegido para mostrar unos datos u otros
        
        // Do any additional setup after loading the view.
    }
    
    func setNavigationItemsBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Atras", style: .plain, target: self, action: #selector(HealthyRutinaViewController.dismissView(_:)))
        let image = UIImage(named: "nutricon")
        let imageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        
        
    }
    
    @objc func dismissView(_ sender: AnyObject){
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func setStackNavigation() {
        let detail = DetailRutinaPage1ViewController()
        let profile = HealthyProfileViewController()
        self.navigationController?.viewControllers = [detail,profile]
        
        
    }


  

}
