//
//  HealthyDietaTableViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 27/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

enum FoodType: Int {
    case desayuno = 0
    case almuerzo
    case comida
    case merienda
    case cena
    
    func name() -> String {
        switch self {
        case .desayuno:
            return "Desayuno"
        case .almuerzo:
            return "Almuerzo"
        case .comida:
            return "Comida"
        case .merienda:
            return "Merienda"
        case .cena:
            return "Cena"
        }
    }
    
    func headerNameImage() -> String {
        switch self {
        case .desayuno:
            return "headerFood"
        case .almuerzo:
            return "headerFood1"
        case .comida:
            return "headerFood2"
        case .merienda:
            return "headerFood3"
        case .cena:
            return "headerFood4"
        }
    }
}

class HealthyDietaTableViewController: UITableViewController {
    

    var misAlimentos = [String]()
    
    let sectionData = [
        FoodType.desayuno : ["Leche","Zumo","Galletas","Huevo cocido","Avena de Sabores","Piña"],
        FoodType.almuerzo : ["Sandwich","Platano","Bocadillo de pavo","Zumo de frutas"],
        FoodType.comida : ["Pasta","Arroz","Legumbres","Verduras","Ternera","Pollo"],
        FoodType.merienda : ["Sandwich","Platano","Bocadillo de pavo","Zumo de frutas"],
        FoodType.cena : ["Pescado","Atún","Ensalada Variada","Patata Cocida","Alubias Verdes"],
    ]
    
    let calorias = ["50 Kcal","100 Kcal","120 Kcal","500 Kcal","600 Kcal","10 Kcal","250 Kcal","400 Kcal","300 Kcal","400 Kcal","250 Kcal","340 Kcal","190 Kcal","120 Kcal","80 Kcal","400 Kcal","450 Kcal","350 Kcal","100 Kcal","500 Kcal","200 Kcal","70 Kcal","200 Kcal","90 Kcal","300 Kcal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setItemBar()
        self.title = "Dietas"
        self.tableView.allowsMultipleSelection = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(DietaTableViewCell.nib(), forCellReuseIdentifier: "Cell")
        self.tableView.register(HeaderComidasTableViewCell.self, forCellReuseIdentifier: "HeaderComidasTableViewCell")
        self.tableView.reloadData()
    }
    
    func setItemBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Mi Dieta", style: .plain, target: self, action: #selector(HealthyRutinaViewController.tapNext(_:)))
    }
    
    @objc func tapNext(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(misAlimentos, forKey: "alimentos")
        
        
        let midietaController = HealthyMiDietaViewController()
        self.navigationController?.pushViewController(midietaController, animated: true)
        
    }


    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foodType = FoodType.init(rawValue: section)!
        
        return sectionData[foodType]!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DietaTableViewCell
        
        let foodType = FoodType.init(rawValue: indexPath.section)!
        
        let foodName = sectionData[foodType]![indexPath.row]
        
        cell.foodLabel.text = foodName
        cell.kcalLabel.text = calorias[indexPath.row]
      
        if cell.isSelected {
            cell.imageCheck.isHidden = false
        }else{
            cell.imageCheck.isHidden = true
        }
        
        return cell
    }
    
    //Returns the view Headers
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let foodType = FoodType.init(rawValue: section)!
        let headerView = Bundle.main.loadNibNamed("CustomHeaderFood", owner: self, options: nil)?.first as! CustomHeaderFood
        headerView.setImageHeader(image: foodType.headerNameImage())
        headerView.setLabelHeader(title: foodType.name())
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160.0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
  
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Celda seleccionada : \(indexPath.item)")
        let cell = tableView.cellForRow(at: indexPath) as! DietaTableViewCell
        print("Cell text = \(String(describing: cell.textLabel?.text))")
        misAlimentos.append((cell.foodLabel.text!))
        cell.imageCheck.isHidden = false
    }
    
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Celda deseleccionada : \(indexPath.item)")
        let cell = tableView.cellForRow(at: indexPath) as! DietaTableViewCell
        misAlimentos.removeAll(where: {$0 == cell.foodLabel.text})
        cell.imageCheck.isHidden = true
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    
    
}
