//
//  CustomHeaderFood.swift
//  HealthyWorld
//
//  Created by Jorge Martín on 09/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation
import UIKit

class CustomHeaderFood: UIView {
    
    @IBOutlet weak var imageHeader: UIImageView!
    
    @IBOutlet weak var labelHeader: UILabel!
    
    public func setImageHeader(image:String) {
        self.imageHeader.image = UIImage(named: image)
    }
    
    public func setLabelHeader(title:String) {
        self.labelHeader.text = title
    }
    
    
    
    
}
