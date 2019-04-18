//
//  CustomTableView.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 17/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation
import UIKit

class CustomTableView: UIView, UITableViewDelegate,UITableViewDataSource {
    
    var ejercicios:[String:[String]] = [
        "Rutina de Pectorales":["Press de Banca","Aperturas con Mancuernas","Fondos en Paralelas","Press Inclinado","Cruce de Poleas","Flexiones","Contractor","Press Mancuernas","Peck Deck","Press Declinado","Pull Over","Abdominales"],
        "Rutina de Hombros":["Press Militar","Pajaros con Mancuerna","Elevaciones Laterales","Elevaciones a un Brazo","Encogimientos de Hombro","Press Trasnuca","Apertura invertida en polea","Abdominales"],
        "Rutina de Piernas":["Sentadillas","Prensa Inclinada","Extensiones de Cuadriceps","Extensiones de Femoral","Gemelo en Maquina","Zancadas","Sentadillas Bulgaras","Peso Muerto Rumano","Sentadillas Frontales","Abdominales"],
        "Rutina de Espalda":["Jalón tras Nuca","Peso Muerto","Jalón al Pecho","Remo en Barra","Estiramiento de Espalda","Remo con Mancuernas","Hiperextension Lumbar","Dominadas","Abdominales"],
        "Rutina de Biceps":["Curl de Biceps en Barra","Press Alterno Mancuernas","Press Martillo Mancuernas","Curl Concentrado","Dominadas Supinas","Curl cerrado con Cable","Extensiones Invertidas","Curl Banco Scott","Curl Acostado","Flexiones en polea Alta"],
        "Rutina de Triceps":["Jalones con Barra","Jalones en Polea Cuerda","Extensiones Invertidas","Fondos entre Bancos","Patadas Traseras","Press Francés","Flexiones en Paralelas","Extensiones sentado encima de Cabeza"],
        "Rutina de Cardio":["Bicicleta","Eliptica","Remar","Natacion","Padel","Tenis","Hit","Running"],
        "Rutina de Crossfit":["Sentadillas","OverHead Squats","Pistol Squats","Burpees","Muscle Ups","Handstand Push Ups","Rowing","Box Jumps","Cluster","Fondos de Anilla","Clean","Jerk","Snatch"],
        "Rutina de Powerlifting":["Sentadillas","OverHead Squats","Pistol Squats","Burpees","Muscle Ups","Handstand Push Ups","Rowing","Box Jumps","Cluster","Fondos de Anilla","Clean","Jerk","Snatch"],
        "Rutina de Definicion":["Bicicleta","Eliptica","Remar","Natacion","Padel","Tenis","Hit","Running"]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var contentView: UIView!
    
    public var keyRutina:String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setDelegateAndDataSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        setDelegateAndDataSource()
    }
    
    func setDelegateAndDataSource() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.keyRutina = appDelegate.keyRutina
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ejercicios[self.keyRutina]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var ejers = self.ejercicios[self.keyRutina]
        //cell.labelEjercicio.text = ejers![indexPath.item]
        //cell.labelEjercicio.text = ejers![indexPath.item]
        cell.textLabel?.text = ejers![indexPath.item]
        cell.textLabel?.textAlignment = .center
        cell.imageView?.image = #imageLiteral(resourceName: "fitnesscon")
        cell.detailTextLabel?.text = "Test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    
    func setup()
    {
        contentView = loadViewFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
     
    }
    
    func loadViewFromNib() -> UIView!
    {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    
    

    
   
    
    
    
    
    
    
    
    
    
}
