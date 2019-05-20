//
//  DietaTableViewCell.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 20/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class DietaTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCheck: UIImageView!
    
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var kcalLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib.init(nibName: "DietaTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setFoodInLabel(food:String) {
        self.foodLabel.text = food
    }
    
    public func setKcalInLabel(kcal:String) {
        self.kcalLabel.text = kcal
    }
    
}
