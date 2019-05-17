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
    
    @IBOutlet weak var animatedView: AnimatedGradientView!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var fieldWeight: UITextField!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var fieldHeight: UITextField!
    
    @IBOutlet weak var objectiveLabel: UILabel!
    
    @IBOutlet weak var fieldObjective: UITextField!
    
    @IBOutlet weak var buttonInit: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTapGestureRecognizer()
        backgroundAnimation()
        setComponents()
        
        // Do any additional setup after loading the view.
    }
    
    func saveDataUser() {
        let user = UserManager.instance.getUser(key: UserManager.kUserDefaultsKey)
        user.height = self.fieldHeight.text
        user.weight = self.fieldWeight.text
        user.objective = self.fieldObjective.text
        
        UserManager.instance.saveUser(user: user, key: UserManager.kUserDefaultsKey)
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
        
        self.animatedView.direction = .up
        self.animatedView.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
                                            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .axial),
                                            (colors: ["#003973", "#E5E5BE"], .down, .axial),
                                            (colors: ["#1E9600", "#FFF200", "#FF0000"], .left, .axial)]
    }
    
    
    func setComponents() {
        //WeightLabel
        self.weightLabel.text = "Peso"
        self.weightLabel.textAlignment = .center
        self.weightLabel.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        self.weightLabel.font = UIFont.systemFont(ofSize: 14)
        self.weightLabel.textColor = .white
        self.weightLabel.layer.masksToBounds = true
        self.weightLabel.layer.cornerRadius = 10
        
        //HeightLabel
        self.heightLabel.text = "Estatura"
        self.heightLabel.textAlignment = .center
        self.heightLabel.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        self.heightLabel.font = UIFont.systemFont(ofSize: 14)
        self.heightLabel.textColor = .white
        self.heightLabel.layer.masksToBounds = true
        self.heightLabel.layer.cornerRadius = 10
        
        //ObjectiveLabel
        self.objectiveLabel.text = "Objetivo"
        self.objectiveLabel.textAlignment = .center
        self.objectiveLabel.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        self.objectiveLabel.font = UIFont.systemFont(ofSize: 14)
        self.objectiveLabel.textColor = .white
        self.objectiveLabel.layer.masksToBounds = true
        self.objectiveLabel.layer.cornerRadius = 10
        
        //FieldObjective
        self.fieldObjective.placeholder = "Seleccione su objetivo.."
        self.fieldObjective.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldObjective.layer.masksToBounds = true
        self.fieldObjective.layer.cornerRadius = 10
        self.fieldObjective.backgroundColor = .white
        self.fieldObjective.textAlignment = .center
        self.fieldObjective.tintColor = .black
        self.fieldObjective.setIcon(#imageLiteral(resourceName: "iconEstatura"))
        let picker = UIPickerView()
        picker.delegate = self
        self.fieldObjective.inputView = picker
        
        ///FieldWeight
        self.fieldWeight.placeholder = "Peso en Kilogramos..."
        self.fieldWeight.translatesAutoresizingMaskIntoConstraints = false
        self.fieldWeight.layer.masksToBounds = true
        self.fieldWeight.layer.cornerRadius = 10
        self.fieldWeight.backgroundColor = .white
        self.fieldWeight.textAlignment = .center
        self.fieldWeight.tintColor = .black
        self.fieldWeight.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldWeight.setIcon(#imageLiteral(resourceName: "iconPeso"))
        
       //FieldHeight
        self.fieldHeight.placeholder = "Altura en metros..."
        self.fieldHeight.layer.masksToBounds = true
        self.fieldHeight.layer.cornerRadius = 10
        self.fieldHeight.backgroundColor = .white
        self.fieldHeight.textAlignment = .center
        self.fieldHeight.tintColor = .black
        self.fieldHeight.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldHeight.setIcon(#imageLiteral(resourceName: "iconEstatura"))
        
        //ButtonInit
        self.buttonInit.titleLabel?.text = "Comenzar"
        self.buttonInit.titleLabel?.textColor = .white
        self.buttonInit.titleLabel?.font  = UIFont.systemFont(ofSize: 14)
        self.buttonInit.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        self.buttonInit.layer.masksToBounds = true
        self.buttonInit.layer.cornerRadius = 10
        
        
    }
    
    @IBAction func tapInit(_ sender: Any) {
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
