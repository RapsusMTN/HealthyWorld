//
//  RutinaDetalleViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 25/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class RutinaDetalleViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    //MARK: -Outlets & Vars
    @IBOutlet weak var imageExercise: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    public var indexExercise:Int!
    
    let pages = [
        Page(imageName: "nutricon", headerText: "Bienvenido a tu app saludable para dietas y rutinas!",bodyText: "Con esta nueva app podrás controlar tu salud de manera adecuada y en el momento que tú desees "),
        Page(imageName: "fitnesscon", headerText: "El ejercicio es muy importante para tu salud!", bodyText: "Entrenar a diario contribuye a mejorar nuestro estado, tanto físico como mental"),
        Page(imageName: "dormicon", headerText: "Nuestro descanso es imprescindible",bodyText: "Dormir todas las noches las horas necesarias nos ayudará a mejorar nuestra vida"),
        Page(imageName: "jovecon", headerText: "Mantenerse sano y jóven siempre",bodyText: "Cumpliendo todos los objetivos mencionados anteriormente , la edad no será un impedimento para encontrarnos saludables y jóvenes toda nuestra vida")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(RutinaDetalleCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    //MARK: -UICollectionViewDelegate and DataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RutinaDetalleCollectionViewCell
        
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }



}
