//
//  HealthyProfileViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 15/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HealthyProfileViewController: UIViewController {
    
    //Right item of the NAvigationControllerBaraaaa
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
        text.isScrollEnabled = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
        
    }()
    
    //Returns the specific viewController
    static func initAndLoad() -> UIViewController {
        let profileViewController: HealthyProfileViewController = HealthyProfileViewController(nibName: "HealthyProfileViewController", bundle: nil)
        return profileViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        self.view.addSubview(textView)
        //self.textView.topAnchor.constraint(equalTo: (self.navigationController?.navigationBar.bottomAnchor)!, constant: 20).isActive = true
        self.textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        self.textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        self.textView.heightAnchor.constraint(equalToConstant: 200)
        
        
        
    }

    
    

}
