//
//  HealthyDietaCreadaViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martín on 21/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HealthyDietaCreadaViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelComidas: UILabel!
    
    @IBOutlet weak var textViewComida: UITextView!
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setFoodSavedInTextView()
        // Do any additional setup after loading the view.
    }
    
    func setViews() {
        self.labelTitle.layer.masksToBounds = true
        self.labelTitle.layer.cornerRadius = 10
        self.labelComidas.layer.masksToBounds = true
        self.labelComidas.layer.cornerRadius = 10
        self.textViewComida.layer.masksToBounds = true
        self.textViewComida.layer.cornerRadius = 10
        self.image1.layer.masksToBounds = true
        self.image1.layer.cornerRadius = 10
        self.image2.layer.masksToBounds = true
        self.image2.layer.cornerRadius = 10
    }


    func setFoodSavedInTextView() {
        let defaults = UserDefaults.standard
        let alimentos = defaults.object(forKey: "arrayAlimentos") as! [String]
        for alimento in alimentos {
            self.textViewComida.text += "\t \(alimento)\n\n\n\n"
            
        }
        self.textViewComida.font = UIFont(name: "Arial Rounded MT Bold", size: 17.0)
        self.textViewComida.textAlignment = .center
        
    }
    
    
    

}
