//
//  HealthyDietaTableViewController.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 27/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HealthyDietaTableViewController: UITableViewController {
    
    let sections:[String] = ["Desayuno","Almuerzo","Comida","Merienda","Cena"]
    let almuerzo:[String] = ["Sandwich","Platano","Bocadillo de pavo","Zumo de frutas"]
    let desayuno:[String] = ["Leche","Zumo","Galletas","Huevo cocido","Avena de Sabores","Piña"]
    let comida:[String] = ["Pasta","Arroz","Legumbres","Verduras","Ternera","Pollo"]
    let merienda:[String] = ["Sandwich","Platano","Bocadillo de pavo","Zumo de frutas"]
    let cena:[String] = ["Pescado","Atún","Ensalada Variada","Patata Cocida","Alubias Verdes"]
    var sectionData: [Int:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionData = [0 : desayuno, 1 : almuerzo, 2 : comida, 3 : merienda, 4 : cena ]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplte implementation, return the number of rows
        return 0
        //(sectionData[section]?.count)!
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = comida[indexPath.row]
    
        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    
}
