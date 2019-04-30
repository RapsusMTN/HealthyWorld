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

class HealthyProfile2ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    public var objectives = ["Fuerza","Definición","Perdida de Peso","Mantenimiento"]

    let scrollView:UIScrollView = {
        let scrollView:UIScrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        
        return scrollView
    }()
    
    
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
    
    let objectiveLabel: UILabel = {
        let label = UILabel()
        label.text = "Objetivo"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fieldObjective: UITextField = {
        let field = UITextField()
        field.placeholder = "Seleccione su objetivo.."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 10
        field.backgroundColor = .white
        field.textAlignment = .center
        field.tintColor = .black
        field.setIcon(#imageLiteral(resourceName: "iconEstatura"))
        return field
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
    
    
    @objc func tapInit(_ sender:UIButton) {
        //Controlar los datos
        if (self.fieldHeight.text?.isEmpty)! || (self.fieldWeight.text?.isEmpty)! || (self.fieldObjective.text?.isEmpty)! {
            let alert = UIAlertController(title: "Espera", message: "Debes introducir todos los datos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }else {
            saveDataUser()
            let mainMenuController = HealthyMenuTabController()
            mainMenuController.modalTransitionStyle = .flipHorizontal
            self.present(mainMenuController, animated: true, completion: nil)
        }
        
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTapGestureRecognizer()
        backgroundAnimation()
        setCustomProfileData2()
        
        // Do any additional setup after loading the view.
    }
    
    func saveDataUser() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.usuario.height = self.fieldHeight.text!
        appDelegate.usuario.weight = self.fieldWeight.text!
        appDelegate.usuario.objective = self.fieldObjective.text!
        
        
        
    }
    
    //añadir evento Tap a la vista para salir del picker cuando el usuario toca fuera de este
    func registerTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)//al puslsar la pantalla desaparece el teclado o picker
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
      
        self.view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        //Añado imagen
        self.scrollView.addSubview(imageView)
        
        self.imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 100).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -100).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    
        //Añado el label de Peso
        self.scrollView.addSubview(weightLabel)
        
        self.weightLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        self.weightLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        self.weightLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        self.weightLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.weightLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el field del peso
        self.scrollView.addSubview(fieldWeight)
        
        self.fieldWeight.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldWeight.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50).isActive = true
        self.fieldWeight.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -50).isActive = true
        self.fieldWeight.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldWeight.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //añado el label de estatura
        self.scrollView.addSubview(heightLabel)
        
        self.heightLabel.topAnchor.constraint(equalTo: fieldWeight.bottomAnchor, constant: 50).isActive = true
        self.heightLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        self.heightLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        self.heightLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.heightLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el field de estatura
        self.scrollView.addSubview(fieldHeight)
        
        self.fieldHeight.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldHeight.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50).isActive = true
        self.fieldHeight.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -50).isActive = true
        self.fieldHeight.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldHeight.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado label de objetivos
        self.scrollView.addSubview(objectiveLabel)
        
        self.objectiveLabel.topAnchor.constraint(equalTo: fieldHeight.bottomAnchor, constant: 50).isActive = true
        self.objectiveLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        self.objectiveLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        self.objectiveLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.objectiveLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
       
        
        //Añado el field de objetivos
        self.scrollView.addSubview(fieldObjective)
        self.fieldObjective.topAnchor.constraint(equalTo: objectiveLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldObjective.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 50).isActive = true
        self.fieldObjective.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -50).isActive = true
        self.fieldObjective.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldObjective.widthAnchor.constraint(equalToConstant: 20).isActive = true
        let picker = UIPickerView()
        picker.delegate = self
        self.fieldObjective.inputView = picker
        
        //Añado Boton de registro
        self.view.addSubview(buttonInit)
        
       // self.buttonInit.topAnchor.constraint(equalTo: fieldObjective.bottomAnchor, constant: 40)
        self.buttonInit.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        self.buttonInit.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        self.buttonInit.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        self.buttonInit.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.buttonInit.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    //MARK: - PickerDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return objectives.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return objectives[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.fieldObjective.text = objectives[row]
    }


   

}
