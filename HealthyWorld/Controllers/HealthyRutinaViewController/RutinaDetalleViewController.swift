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
    
    @IBOutlet weak var labelName: UILabel!
    
    
    public var indexExercise:Int!
    
    public var exerciseName:String!
    
    let pages = [
        Page(imageName: "nutricon", headerText: "Bienvenido a tu app saludable para dietas y rutinas!",bodyText: "Con esta nueva app podrás controlar tu salud de manera adecuada y en el momento que tú desees "),
        Page(imageName: "fitnesscon", headerText: "El ejercicio es muy importante para tu salud!", bodyText: "Entrenar a diario contribuye a mejorar nuestro estado, tanto físico como mental"),
        Page(imageName: "dormicon", headerText: "Nuestro descanso es imprescindible",bodyText: "Dormir todas las noches las horas necesarias nos ayudará a mejorar nuestra vida"),
        Page(imageName: "jovecon", headerText: "Mantenerse sano y jóven siempre",bodyText: "Cumpliendo todos los objetivos mencionados anteriormente , la edad no será un impedimento para encontrarnos saludables y jóvenes toda nuestra vida")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelName.text = exerciseName
        configurateViews()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(RutinaDetalleCollectionViewCell.nib(), forCellWithReuseIdentifier: "Cell")
        self.collectionView.isScrollEnabled = true
        self.collectionView.showsVerticalScrollIndicator = true
    }
    
    func configurateViews() {
        self.labelName.font = .boldSystemFont(ofSize: 20)
        self.labelName.textColor = .black
        self.labelName.backgroundColor = UIColor(red: 184/255, green: 255/255, blue: 176/255, alpha: 1.0)
     
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        self.pageControl.currentPage = Int(x / view.frame.width)
        
        //print(x, view.frame.width, x / view.frame.width)
        
    }
    
    
    //MARK: -UICollectionViewDelegate and DataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RutinaDetalleCollectionViewCell
        cell.textView.text = pages[indexPath.row].bodyText
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }


    

}
