//
//  HealthyMiDietaViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martín on 10/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HealthyMiDietaViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var alimentos:[String] = []

    @IBOutlet weak var kcalTotales: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAlimentosFromUserDefaults()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.alimentos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.alimentos[indexPath.row]
        
        return cell
    }
    
   
    func getAlimentosFromUserDefaults() {
        let defaults = UserDefaults.standard
        self.alimentos = defaults.object(forKey: "alimentos") as! [String]
        
    }
    

    @IBAction func createDieta(_ sender: Any) {
        
        let alert = UIAlertController(title: "Crear Dieta", message: "¿Desea crear la dieta?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            print("Pressed")
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default) { (UIAlertAction) in
            print("Cancelado")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    

}
