//
//  MiPerfilViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 18/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit
import SwiftConfettiView


class MiPerfilViewController: UIViewController {

    
    @IBOutlet weak var labelNombre: UILabel!
    
    @IBOutlet weak var labelEdad: UILabel!
    
    @IBOutlet weak var labelImage: UIImageView!
    
    @IBOutlet weak var labelSexo: UILabel!
    
    @IBOutlet weak var labelAltura: UILabel!
    
    @IBOutlet weak var labelPeso: UILabel!
    
    @IBOutlet weak var labelBienvenida: UILabel!
    
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createConfetti()
        setStyleViews()
        setNavigationBarItems()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    func setDataInLabels() {
        
        
        
        
    }
    
   
    
    func createConfetti() {
        let confettiView = SwiftConfettiView()
        confettiView.colors = [.red,.green,.blue]
        confettiView.intensity = 0.75
        confettiView.type = .star
        confettiView.startConfetti()
        confettiView.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.view.addSubview(confettiView)
        confettiView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        confettiView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        confettiView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        confettiView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    func setStyleViews() {
        self.labelEdad.layer.masksToBounds = true
        self.labelEdad.layer.cornerRadius = 10
        self.labelNombre.layer.masksToBounds = true
        self.labelNombre.layer.cornerRadius = 10
        self.labelSexo.layer.masksToBounds = true
        self.labelSexo.layer.cornerRadius = 10
        
        
    }
    
    func setNavigationBarItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Estadísticas", style: .plain, target: self, action: #selector(MiPerfilViewController.tapped(_:)))
        
        
        
    }

    
    @objc func tapped(_ sender:AnyObject) {
        let miPerfil2 = HealthyMiPerfil2ViewController()
        self.navigationController?.pushViewController(miPerfil2, animated: true)
        
    }
    

}
