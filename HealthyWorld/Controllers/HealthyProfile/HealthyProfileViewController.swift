//
//  HealthyProfileViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 15/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit
import AnimatedGradientView

class HealthyProfileViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
   //Edades para el picker
   public var ages:[Int] = []
    
   public var example = ["Jorge","Timoteo","Alvaro","Friki","Amigos","Mios","Vida"]
    
   let picker: UIPickerView = {
       let picker = UIPickerView()
       return picker
    }()
    
    //Right item of the NAvigationControllerBar
    let rightBarButtonItem: UIBarButtonItem = {
       let rightButton = UIBarButtonItem(title: "Siguiente", style: .plain, target: self, action: nil)
       rightButton.tintColor = .blue
       return rightButton
    }()
    
    let leftBarButtonItem: UIBarButtonItem = {
        let leftButton = UIBarButtonItem(title: "Atras", style: .plain, target: self, action: nil)
        leftButton.tintColor = .blue
        return leftButton
    }()
    
    let textView: UITextView = {
        let text = UITextView()
        let attributed = NSMutableAttributedString(string: "Para comenzar tu nueva etapa saludable, necesitamos que nos proporciones tus datos.", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        text.attributedText = attributed
        text.textAlignment = .center
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 10
        text.isScrollEnabled = false
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
        
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
       label.text = "Nombre"
       label.textAlignment = .center
       label.backgroundColor = #colorLiteral(red: 0.3847625569, green: 0.8884835025, blue: 0.3051646185, alpha: 1)
       label.font = UIFont.systemFont(ofSize: 14)
       label.textColor = .white
       label.layer.masksToBounds = true
       label.layer.cornerRadius = 10
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Edad"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3847625569, green: 0.8884835025, blue: 0.3051646185, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fieldName: UITextField = {
       let field = UITextField()
       field.translatesAutoresizingMaskIntoConstraints = false
       field.layer.masksToBounds = true
       field.layer.cornerRadius = 10
       field.backgroundColor = .white
       field.tintColor = .black
       field.setIcon(#imageLiteral(resourceName: "iconName"))
       return field
    }()
    
    let fieldAge: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 10
        field.backgroundColor = .white
        field.tintColor = .black
        field.setIcon(#imageLiteral(resourceName: "iconPeso"))
        return field
    }()
    
    
    //Returns the specific viewController
    static func initAndLoad() -> UIViewController {
        let profileViewController: HealthyProfileViewController = HealthyProfileViewController(nibName: "HealthyProfileViewController", bundle: nil)
        return profileViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        //fillPicker()
        setNavigationItemsBar()
        setCustomProfileData()
    }
    
    func setNavigationItemsBar() {
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        self.navigationItem.leftBarButtonItem?.isEnabled = false
        let image = UIImage(named: "nutricon")
        let imageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        
        
    }
    
    //Set the views and constraints into the frame
    private func setCustomProfileData() {
        //Set animations
        setAnimationBackground()
        //Añado el textView a mi view principal
        self.view.addSubview(textView)
        //self.textView.topAnchor.constraint(equalTo: (self.navigationController?.navigationBar.bottomAnchor)!, constant: 20).isActive = true
        self.textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.textView.heightAnchor.constraint(equalToConstant: 200)
        
        //Añado el label del Name
        self.view.addSubview(nameLabel)
        self.nameLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 20).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.nameLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el textField del name
        self.view.addSubview(fieldName)
        self.fieldName.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        self.fieldName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        self.fieldName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldName.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el label edad
        self.view.addSubview(ageLabel)
        self.ageLabel.topAnchor.constraint(equalTo: fieldName.bottomAnchor, constant: 10).isActive = true
        self.ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150).isActive = true
        self.ageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -150).isActive = true
        self.ageLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.ageLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el field edad
        self.view.addSubview(fieldAge)
        self.fieldAge.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldAge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        self.fieldAge.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        self.fieldAge.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldAge.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.fieldAge.inputView = self.picker
    }
    
    func setAnimationBackground() {
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
    
    //Fill the picker
    func fillPicker() {
        for i in 1...100 {
            self.ages.append(i)
        }
        self.ages.debugDescription
        
    }

    
    

}

extension UITextField {
    
    //Para añadir iconos a mis textFields
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    
    
    
    
}
