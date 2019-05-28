//
//  HealthyRutinaTestViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 27/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HealthyRutinaTestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    //MARK: -Outlets & Vars
    
    @IBOutlet weak var videoView: VideoView!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var labelSeries: UILabel!
    
    public var selectedIndex:Int!
    
    public var texto:String!
    
    public var seriesAndReps:String!
    
    public var keyRutina:String!
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setNavigationItemsBar()
        configurateViews()
        self.tableView.register(RutinaTableViewCell.nib(), forCellReuseIdentifier: String(describing: RutinaTableViewCell.self))
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.keyRutina = appDelegate.keyRutina
        configureVideowith(urlPath: (Bundle.main.url(forResource: "buendia", withExtension: "mp4")?.absoluteString)!)
    }

    //MARK: -Funcs
    func configureVideowith(urlPath: String) {
        self.videoView.configure(url: (urlPath))
        self.videoView.isLoop = true
        self.videoView.play()
        
        
    }
    
    func setNavigationItemsBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Volver", style: .plain, target: self, action: #selector(HealthyRutinaViewController.dismissView(_:)))
        
        let image = UIImage(named: "nutricon")
        let imageView:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        
    }
    
    func configurateViews() {
        self.labelDescription.text = texto
        self.labelDescription.layer.masksToBounds = true
        self.labelDescription.layer.cornerRadius = 10
        self.labelSeries.text = seriesAndReps
        self.labelSeries.font = .boldSystemFont(ofSize: 20)
        self.labelSeries.textColor = .black
        self.labelSeries.backgroundColor = UIColor(red: 184/255, green: 255/255, blue: 176/255, alpha: 1.0)
       
    }
    
    @objc func dismissView(_ sender: AnyObject){
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: -TableViewDelegateAndDataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath) as! RutinaTableViewCell
        let vc = RutinaDetalleViewController()
        vc.indexExercise = indexPath.item
        vc.exerciseName = cell.labelEjercicio.text
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: RutinaTableViewCell.self), for: indexPath) as! RutinaTableViewCell
        var ejers = self.ejercicios[self.keyRutina]!
        cell.labelEjercicio.text = ejers[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (ejercicios[self.keyRutina]?.count)!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
   

}
