//
//  RutinaTableViewCell.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 18/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class RutinaTableViewCell: UITableViewCell {

    @IBOutlet weak var labelEjercicio: UILabel!
    
    public var texto:String!
    
    static func nib() -> UINib {
        return UINib.init(nibName: "RutinaTableViewCell", bundle: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
      
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
        // Configure the view for the selected state
    }
    
    func setText(text:String) {
        texto = text
    }
    
    
    
}
