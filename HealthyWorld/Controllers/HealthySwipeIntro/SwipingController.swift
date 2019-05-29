//
//  SwipingController.swift
//  AutoLayout
//
//  Created by Jorge Martin Reyero on 14/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation
import UIKit
import SwiftSpinner

class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
   
    //Encapsulacion de var in the class
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ANTERIOR", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SIGUIENTE", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if nextIndex == pages.count - 1  {
            if nextIndex == pages.count - 1  {
                let profileController = HealthyProfileViewController()
                //INSTANCIAMOS EL NAVIGATION CON EL VIEWCOTROLLER QUE QUIERES QUE SE MUESTRE A CONTINUACION
                let navigationController = UINavigationController(rootViewController: profileController)
                navigationController.navigationBar.isHidden = false
                //PRESENTAMOS EL NAVIGATION, PARA QUE LOS SIGUIENTES VIEWCONTROLLERS TENGAN EN SU PROPIEDAD 'viewcontroller.navigationViewController' el navigation que acabamos de instanciar
                //Muestro el spinner de carga
                SwiftSpinner.show(duration: 4.0, title: "Bienvenido al mundo saludable..")
                self.present(navigationController, animated: true, completion: nil)
            
            }
        }
    }
    
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .green
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    //Sets the backGroundImage
    private let backgroundImage:UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "blur1")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    
    let pages = [
        Page(imageName: "nutricon", headerText: "Bienvenido a tu app saludable para dietas y rutinas!",bodyText: "Con esta nueva app podrás controlar tu salud de manera adecuada y en el momento que tú desees "),
        Page(imageName: "pesanew", headerText: "El ejercicio es muy importante para tu salud!", bodyText: "Entrenar a diario contribuye a mejorar nuestro estado, tanto físico como mental"),
        Page(imageName: "dormirNew", headerText: "Nuestro descanso es imprescindible",bodyText: "Dormir todas las noches las horas necesarias nos ayudará a mejorar nuestra vida"),
        Page(imageName: "genteNew", headerText: "Mantenerse sano y jóven siempre",bodyText: "Cumpliendo todos los objetivos mencionados anteriormente , la edad no será un impedimento para encontrarnos saludables y jóvenes toda nuestra vida")
    ]
    
    
    fileprivate func setupBottomControls() {
        let bottomControlsContainer = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsContainer.distribution = .fillEqually
        //bottomControlsContainer.axis = .horizontal
        view.addSubview(bottomControlsContainer)
        
        NSLayoutConstraint.activate([
            bottomControlsContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsContainer.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
        //print(x, view.frame.width, x / view.frame.width)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView.backgroundView = backgroundImage
        collectionView.backgroundColor = .white
        setupBottomControls()
        //setupBackgroundImage()
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
    
    
    func setupBackgroundImage() {

        collectionView.addSubview(backgroundImage)

        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 0)
            ])






    }
    
    
  

    
    
}
