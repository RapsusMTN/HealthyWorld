//
//  RutinaDetalleCollectionViewCell.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 27/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class RutinaDetalleCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var textView: UITextView!
    
    
    
    static func nib() -> UINib {
        return UINib.init(nibName: "RutinaDetalleCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
