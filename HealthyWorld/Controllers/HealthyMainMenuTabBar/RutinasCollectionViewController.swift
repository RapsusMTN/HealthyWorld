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
//
//    let myvideo:String = (Bundle.main.url(forResource: "video", withExtension: "mp4")?.absoluteString)!
//    let videos = [myvideo,myvideo,myvideo,myvideo,myvideo,myvideo,myvideo,myvideo,myvideo,myvideo]
    var ejercicios = ["Pectoral","Hombros","Pierna","Espalda","Biceps","Triceps","Cardio","Crossfit","Powerlifting","Definicion"]
    var images = ["pecho","hombro","pierna","espalda","biceps","triceps","cardio","crossfit","power","definicion"]
    var descripcionesRutina = ["Rutina de Pectorales","Rutina de Hombros","Rutina de Piernas","Rutina de espalda","Rutina de Biceps","Rutina de Triceps","Rutina de Cardio","Rutina de Crossfit","Rutina de Powerlifting","Rutina de Definicion"]
    
    
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
        
        let rutinaDetail0 = HealthyRutinaViewController()
        rutinaDetail0.modalTransitionStyle = .coverVertical
        let navController = UINavigationController(rootViewController: rutinaDetail0)
        //Depende la celda que seleccione entrara a un ViewController u otro
        rutinaDetail0.texto = descripcionesRutina[indexCell]
        rutinaDetail0.selectedIndex = indexCell
        self.present(navController, animated: true, completion: nil)
        
        
        
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
