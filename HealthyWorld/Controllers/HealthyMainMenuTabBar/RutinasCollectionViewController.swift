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
    
    func selectExerciseAt(indexCell: Int) {
        
        //Depende la celda que seleccione entrara a un ViewController u otro
        switch indexCell {
        case 0:
            let rutinaDetail0 = HealthyRutinaViewController()
            rutinaDetail0.modalTransitionStyle = .coverVertical
            self.present(rutinaDetail0, animated: true, completion: nil)
        case 1:
            print("Celda 1")
        case 2:
            print("Celda 2")
        case 3:
            print("Celda 3")
        case 4:
            print("Celda 4")
        case 5:
            print("Celda 5")
        case 6:
            print("Celda 6")
        case 7:
            print("Celda 7")
        case 8:
            print("Celda 8")
        case 9:
            print("Celda 9")
        default:
            return
        }
        
        
        
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("SELECCIONADO la celda = \(indexPath.item)")
        selectExerciseAt(indexCell: indexPath.item)
    }
    

    
}
