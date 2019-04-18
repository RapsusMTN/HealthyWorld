//
//  HealthyProfile2ViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 16/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit
import AnimatedGradientView
import SwiftSpinner

class HealthyProfile2ViewController: UIViewController {
    
    

    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Peso"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Estatura"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fieldWeight: UITextField = {
        let field = UITextField()
        field.placeholder = "Peso en Kilogramos..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 10
        field.backgroundColor = .white
        field.textAlignment = .center
        field.tintColor = .black
        field.setIcon(#imageLiteral(resourceName: "iconPeso"))
        return field
    }()
    
    let fieldHeight: UITextField = {
        let field = UITextField()
        field.placeholder = "Altura en metros..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 10
        field.backgroundColor = .white
        field.textAlignment = .center
        field.tintColor = .black
        field.setIcon(#imageLiteral(resourceName: "iconEstatura"))
        return field
    }()
    
    let imageView:UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "nutricon") )
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    let buttonPrev: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "iconPrev"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        button.addTarget(self, action: #selector(tapRegister(_:)), for: .touchUpInside)
        return button
        
        
    }()
    
    let buttonInit: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Comenzar", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        button.addTarget(self, action: #selector(tapInit(_:)), for: .touchUpInside)
        return button
    }()
    
    
    @objc func tapRegister(_ sender: UIButton) {
        let profile1 = HealthyProfileViewController()
        let navController = UINavigationController(rootViewController: profile1)
        navController.modalTransitionStyle = .partialCurl
        navController.navigationBar.isHidden = false
        self.present(navController, animated: true, completion: nil)
        
    }
    
    @objc func tapInit(_ sender:UIButton) {
        //Navegacion al menu principal
        SwiftSpinner.show(delay: 0.2, title: "Cargando los datos...")
        let mainMenuController = HealthyMenuTabController()
        mainMenuController.modalTransitionStyle = .flipHorizontal
        self.present(mainMenuController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundAnimation()
        setCustomProfileData2()
       
        // Do any additional setup after loading the view.
    }
    
    
    func backgroundAnimation() {
        let animatedGradient = AnimatedGradientView()
        animatedGradient.translatesAutoresizingMaskIntoConstraints = false
        animatedGradient.direction = .up
        animatedGradient.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
                                            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .axial),
                                            (colors: ["#003973", "#E5E5BE"], .down, .axial),
                                            (colors: ["#1E9600", "#FFF200", "#FF0000"], .left, .axial)]
        self.view.addSubview(animatedGradient)
        animatedGradient.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        animatedGradient.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        animatedGradient.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        animatedGradient.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setCustomProfileData2() {
        
        //Añado imagen
        self.view.addSubview(imageView)
        self.imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        //Añado el label de Peso
        self.view.addSubview(weightLabel)
        self.weightLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        self.weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.weightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.weightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.weightLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el field del peso
        self.view.addSubview(fieldWeight)
        self.fieldWeight.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldWeight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        self.fieldWeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        self.fieldWeight.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldWeight.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //añado el label de estatura
        self.view.addSubview(heightLabel)
        self.heightLabel.topAnchor.constraint(equalTo: fieldWeight.bottomAnchor, constant: 50).isActive = true
        self.heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.heightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.heightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.heightLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el field de estatura
        self.view.addSubview(fieldHeight)
        self.fieldHeight.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldHeight.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        self.fieldHeight.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        self.fieldHeight.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldHeight.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado boton prev
        self.view.addSubview(buttonPrev)
        self.buttonPrev.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.buttonPrev.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        self.buttonPrev.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -340).isActive = true
        self.buttonPrev.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.buttonPrev.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Añado Boton de registro
        self.view.addSubview(buttonInit)
    
        self.buttonInit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 280).isActive = true
        self.buttonInit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.buttonInit.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        self.buttonInit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.buttonInit.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }


   

}
