//
//  HealthyMiPerfil2ViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 19/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit
import RKPieChart

class HealthyMiPerfil2ViewController: UIViewController {

    
    @IBOutlet weak var chartView: RKPieChartView!
    
    
    
    
    
    let labelKcal: UILabel = {
        let label = UILabel()
        label.text = "1.500 KCal / Día"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .black
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewsAndConstraints()
        calculateMetabolismoBasal()
        // Do any additional setup after loading the view.
    }
    
    func calculateMetabolismoBasal() {
        let user = UserManager.instance.getUser(key: UserManager.kUserDefaultsKey)
        
        let peso = Double(user.weight!)
        let altura = Double(user.height!)! * 100
        let edad = Double(user.age!)
        //Mujer
        if user.genre == "Mujer" {
            let metabolismoBasal = (10 * peso!) + (6.25 * altura)
            let met2 = metabolismoBasal - (5 * edad!) - 161
            let exactNumber = Int(met2)
            self.labelKcal.text = "\(String(exactNumber)) KCal/Día"
        } else {//Hombre
            let metabolismoBasal = (10 * peso!) + (6.25 * altura)
            let met2 = metabolismoBasal - (5 * edad!) + 5
            let exactNumber = Int(met2)
            self.labelKcal.text = "\(String(exactNumber)) KCal/Día"
        }
        
        //Calculo de gramos por Kg
        
        
    }
    
    func setViewsAndConstraints() {
        let proteina: RKPieChartItem = RKPieChartItem(ratio: 25, color: .red, title: "Proteina")
        let hidratos: RKPieChartItem = RKPieChartItem(ratio: 50, color: .orange, title: "Hidratos de Carbono")
        let grasas: RKPieChartItem = RKPieChartItem(ratio: 20, color: .green, title: "Grasas")
        let vitMinerales: RKPieChartItem = RKPieChartItem(ratio: 15, color: .cyan, title: "Vitaminas y Minerales")
        
        let chartView = RKPieChartView(items: [proteina,hidratos,grasas,vitMinerales], centerTitle: "Reparto de Nutrientes")
        chartView.isAnimationActivated = true
        chartView.circleColor = .purple
        chartView.arcWidth = 80
        chartView.style = .butt
        chartView.isIntensityActivated = true
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(chartView)
        chartView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        
        //Label KCal diarias
        self.view.addSubview(labelKcal)
        self.labelKcal.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 10).isActive = true
        self.labelKcal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        self.labelKcal.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        self.labelKcal.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.labelKcal.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        //Cantidades en gramos
        let proteLabel = UILabel()
        proteLabel.backgroundColor = .red
        proteLabel.text = "115 g Proteina"
        proteLabel.textAlignment = .center
        proteLabel.textColor = .black
        proteLabel.font = .boldSystemFont(ofSize: 14)
        
        let grasaLabel = UILabel()
        grasaLabel.backgroundColor = .green
        grasaLabel.text = "90 g Grasa"
        grasaLabel.textAlignment = .center
        grasaLabel.textColor = .black
        grasaLabel.font = .boldSystemFont(ofSize: 14)
        
        let hidratosLabel = UILabel()
        hidratosLabel.backgroundColor = .orange
        hidratosLabel.text = "200 g Hidratos"
        hidratosLabel.textAlignment = .center
        hidratosLabel.textColor = .black
        hidratosLabel.font = .boldSystemFont(ofSize: 14)
        
        let vitLabel = UILabel()
        vitLabel.backgroundColor = .cyan
        vitLabel.text = "135 g Vit y Min"
        vitLabel.textAlignment = .center
        vitLabel.textColor = .black
        vitLabel.font = .boldSystemFont(ofSize: 14)
        
        let stack = UIStackView(arrangedSubviews: [proteLabel,grasaLabel,hidratosLabel,vitLabel])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stack)
        stack.topAnchor.constraint(equalTo: self.labelKcal.bottomAnchor, constant: 0).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        
    }


    
}

