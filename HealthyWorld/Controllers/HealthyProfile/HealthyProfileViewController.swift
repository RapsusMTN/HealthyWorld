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
    public var stringAges:[String] = []
    
    public var example = ["Jorge","Timoteo","Alvaro","Friki","Amigos","Mios","Vida"]
    
    let picker: UIPickerView = {
           let picker = UIPickerView()
           return picker
    }()
    
    let datePicker: UIDatePicker = {
       let datepicker = UIDatePicker()
       datepicker.datePickerMode = .date
       datepicker.locale = Locale(identifier: "es")
       datepicker.addTarget(self, action: #selector(HealthyProfileViewController.dateChanged(datePicker:)), for: .valueChanged )
       return datepicker
    }()
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "es")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        self.fieldDate.text = dateFormatter.string(from: self.datePicker.date)
        let edad = self.getAge(fecha: self.datePicker.date)
    }
    
    //Right item of the NAvigationControllerBar
    let rightBarButtonItem: UIBarButtonItem = {
        let rightButton = UIBarButtonItem(title: "Siguiente", style: .plain, target: self, action: #selector(tapped))
        rightButton.tintColor = .blue
       return rightButton
    }()
    
    
    let textView: UITextView = {
        let text = UITextView()
        text.backgroundColor = #colorLiteral(red: 0.4258117608, green: 0.9414469959, blue: 0.5609530896, alpha: 0)
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
    //#colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
    let nameLabel: UILabel = {
       let label = UILabel()
       label.text = "Nombre"
       label.textAlignment = .center
       label.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
       label.font = UIFont.systemFont(ofSize: 14)
       label.textColor = .white
       label.layer.masksToBounds = true
       label.layer.cornerRadius = 10
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
 
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Nacimiento"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sexLabel: UILabel = {
        let label = UILabel()
        label.text = "Sexo"
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let fieldName: UITextField = {
       let field = UITextField()
       field.placeholder = "Introduce tu nombre..."
       field.translatesAutoresizingMaskIntoConstraints = false
       field.layer.masksToBounds = true
       field.layer.cornerRadius = 10
       field.backgroundColor = .white
       field.textAlignment = .center
       field.tintColor = .black
       field.setIcon(#imageLiteral(resourceName: "iconName"))
       return field
    }()
    
    let fieldDate: UITextField = {
        let field = UITextField()
        field.placeholder = "Fecha de nacimiento..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.masksToBounds = true
        field.textAlignment = .center
        field.layer.cornerRadius = 10
        field.backgroundColor = .white
        field.tintColor = .black
        field.setIcon(#imageLiteral(resourceName: "iconAge"))
        return field
    }()

    
    let segmentedSex: UISegmentedControl = {
       let segmented = UISegmentedControl(items: ["Hombre","Mujer"])
       segmented.selectedSegmentIndex = 0
       segmented.translatesAutoresizingMaskIntoConstraints = false
       segmented.addTarget(self, action: #selector(selectedIndex(_:)), for: .valueChanged )
       segmented.layer.cornerRadius = 10
       segmented.backgroundColor = .white
       segmented.tintColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
       return segmented
    }()
    
    let buttonRegister: UIButton = {
       let button = UIButton()
       button.translatesAutoresizingMaskIntoConstraints = false
       button.setImage(#imageLiteral(resourceName: "iconNext2"), for: .normal)
       button.tintColor = .white
       button.layer.cornerRadius = 10
       button.backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.7921568627, blue: 0.462745098, alpha: 1)
       button.isHidden = true
       //button.addTarget(self, action: #selector(tapRegister), for: .touchUpInside)
       return button
        
        
    }()
    
    @objc func tapped(_ sender: AnyObject) {
        let profile2controller: HealthyProfile2ViewController = HealthyProfile2ViewController()
        profile2controller.modalTransitionStyle = .partialCurl
        self.navigationController?.pushViewController(profile2controller, animated: true)
        print("TOCADO!!")
        
        
    }
    
    
    @objc func selectedIndex(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
          print("Hombre")
        case 1:
          print("Mujer")
        default:
            return
        }
    
    
    }
    //Returns the specific viewController
    static func initAndLoad() -> UIViewController {
        let profileViewController: HealthyProfileViewController = HealthyProfileViewController(nibName: "HealthyProfileViewController", bundle: nil)
        return profileViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTapGestureRecognizer()
        self.picker.delegate = self
        self.picker.dataSource = self
        fillPicker()
        setNavigationItemsBar()
        setCustomProfileData()
    }
    
    //añadir evento Tap a la vista para salir del picker cuando el usuario toca fuera de este
    func registerTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func setNavigationItemsBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Siguiente", style: .plain, target: self, action: #selector(HealthyProfileViewController.tapped(_:)))
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
        self.textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        self.textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        self.textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        self.textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.textView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        //Añado el label del Name
        self.view.addSubview(nameLabel)
        self.nameLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.nameLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el textField del name
        self.view.addSubview(fieldName)
        self.fieldName.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        self.fieldName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        self.fieldName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldName.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el datelabel
        self.view.addSubview(dateLabel)
        self.dateLabel.topAnchor.constraint(equalTo: fieldName.bottomAnchor, constant: 50).isActive = true
        self.dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.dateLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.dateLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado fieldDat
        self.view.addSubview(fieldDate)
        self.fieldDate.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10).isActive = true
        self.fieldDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        self.fieldDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        self.fieldDate.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.fieldDate.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.fieldDate.inputView = self.datePicker
        
        //Añado el fieldLabel
        self.view.addSubview(sexLabel)
        self.sexLabel.topAnchor.constraint(equalTo: fieldDate.bottomAnchor, constant: 50).isActive = true
        self.sexLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.sexLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.sexLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.sexLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Añado el segmented del sexo
        self.view.addSubview(segmentedSex)
        self.segmentedSex.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 10).isActive = true
        self.segmentedSex.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        self.segmentedSex.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        self.segmentedSex.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.segmentedSex.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
      
        //Añado Boton de registro
        self.view.addSubview(buttonRegister)
        //self.buttonRegister.topAnchor.constraint(equalTo: segmentedSex.bottomAnchor, constant: 40).isActive = true
        self.buttonRegister.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 340).isActive = true
        self.buttonRegister.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.buttonRegister.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        self.buttonRegister.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.buttonRegister.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    //Background animations
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
        var ages:[Int] = []
        for i in 1...100 {
            ages.append(i)
        }
        //Aplico un map para castear el array a string
        self.stringAges = ages.map { String($0)}
        
    }
    
    //Returns the correct age for the Date introduced by parameter
    func getAge(fecha:Date) -> Int {
        let year = Calendar.current.component(.year, from: fecha)
        
        let currentDate = Date()
        let currentYear = Calendar.current.component(.year, from: currentDate)
        //Resto el año actual menos el introducido
        let currentAge = currentYear - year
        
        //Edad actual
        return currentAge
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
