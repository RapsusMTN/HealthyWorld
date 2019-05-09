//
//  HeaderComidasTableViewCell.swift
//  HealthyWorld
//
//  Created by Jorge Martín on 09/05/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import UIKit

class HeaderComidasTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageHeader: UIImageView!
    
    @IBOutlet weak var labelHeader: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib.init(nibName: "HeaderComidasTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabelHeader(title: String) {
        self.labelHeader.text = title
    }
    
    func setImageHeader(image:String) {
        self.imageView?.image = UIImage(named: image)
    }
    
}
