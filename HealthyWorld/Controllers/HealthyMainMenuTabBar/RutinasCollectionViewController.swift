//
//  RutinasCollectionViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 16/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit
import AnimatedGradientView

class RutinasCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var ejercicios = ["Pectoral","Hombros","Pierna","Espalda","Biceps","Triceps","Cardio","Crossfit","Powerlifting","Definicion"]
    var images = ["pecho","hombro","pierna","espalda","biceps","triceps","cardio","crossfit","power","definicion"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        //self.collectionView!.register(RutinaCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        setAnimationBackground()
        self.collectionView.register(UINib(nibName: "RutinaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        self.title = "Rutinas"
        self.collectionView.backgroundView = setAnimationBackground()
        
        // Do any additional setup after loading the view.
    }
    
    //Background animations
    func setAnimationBackground() -> AnimatedGradientView {
        let animatedGradient = AnimatedGradientView()
        animatedGradient.translatesAutoresizingMaskIntoConstraints = false
        animatedGradient.direction = .up
        animatedGradient.animationValues = [(colors: ["#2BC0E4", "#EAECC6"], .up, .axial),
                                            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .axial),
                                            (colors: ["#003973", "#E5E5BE"], .down, .axial),
                                            (colors: ["#1E9600", "#FFF200", "#FF0000"], .left, .axial)]
//        self.collectionView.addSubview(animatedGradient)
//        animatedGradient.topAnchor.constraint(equalTo: collectionView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        animatedGradient.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 0).isActive = true
//        animatedGradient.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 0).isActive = true
//        animatedGradient.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0).isActive = true
//
        return animatedGradient
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ejercicios.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",for: indexPath) as! RutinaCollectionViewCell
        // Configure the cell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 10
        cell.labelInfo.text = ejercicios[indexPath.item]
        cell.imageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    

    
}
