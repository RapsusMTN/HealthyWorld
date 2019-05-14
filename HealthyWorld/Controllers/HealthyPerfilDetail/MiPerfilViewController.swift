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
    
    @IBOutlet weak var labelAltura: UILabel!
    
    @IBOutlet weak var labelPeso: UILabel!
    
    @IBOutlet weak var labelObjetivo: UILabel!
    
    
    @IBOutlet weak var labelSexo: UILabel!
    
    @IBOutlet weak var altura: UILabel!
    
    @IBOutlet weak var peso: UILabel!
    
    @IBOutlet weak var objetivo: UILabel!
    
    @IBOutlet weak var labelBienvenida: UILabel!
    
    @IBOutlet weak var descriptionView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mi Perfil"
        createConfetti()
        setStyleViews()
        setNavigationBarItems()
        setDataInLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    func setDataInLabels() {
        let user = UserManager.instance.getUser(key: UserManager.kUserDefaultsKey)
        self.labelNombre.text = user.username
        self.labelEdad.text = "\(String(describing: user.age!)) años"
        self.labelSexo.text = user.genre
        self.labelAltura.text = "\(String(describing: user.height!)) m"
        self.labelPeso.text = "\(String(describing: user.weight!)) kg"
        self.labelObjetivo.text = user.objective
        self.labelBienvenida.text = user.username
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
        //Set image circle
        self.labelImage.layer.borderWidth = 2
        self.labelImage.layer.masksToBounds = false
        self.labelImage.layer.borderColor = UIColor.black.cgColor
        self.labelImage.layer.cornerRadius = self.labelImage.frame.height/2
        self.labelImage.clipsToBounds = true
        self.labelImage.backgroundColor = #colorLiteral(red: 0.6941176471, green: 1, blue: 0.7098039216, alpha: 1)
        
        self.labelEdad.layer.masksToBounds = true
        self.labelEdad.layer.cornerRadius = 10
        self.labelNombre.layer.masksToBounds = true
        self.labelNombre.layer.cornerRadius = 10
        self.labelSexo.layer.masksToBounds = true
        self.labelSexo.layer.cornerRadius = 10
        self.labelObjetivo.layer.masksToBounds = true
        self.labelObjetivo.layer.cornerRadius = 10
        self.labelAltura.layer.masksToBounds = true
        self.labelAltura.layer.cornerRadius = 10
        self.labelPeso.layer.masksToBounds = true
        self.labelPeso.layer.cornerRadius = 10
        self.altura.layer.masksToBounds = true
        self.altura.layer.cornerRadius = 10
        self.peso.layer.masksToBounds = true
        self.peso.layer.cornerRadius = 10
        self.objetivo.layer.masksToBounds = true
        self.objetivo.layer.cornerRadius = 10
    }
    
    func setNavigationBarItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Estadísticas", style: .plain, target: self, action: #selector(MiPerfilViewController.tapped(_:)))
        
        
        
    }

    
    @objc func tapped(_ sender:AnyObject) {
        let miPerfil2 = HealthyMiPerfil2ViewController()
        self.navigationController?.pushViewController(miPerfil2, animated: true)
        
    }
    

}
