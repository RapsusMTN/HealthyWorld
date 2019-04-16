//
//  HealthyProfilePickerExtension.swift
//  HealthyWorld
//
//  Created by Jorge Martin Reyero on 16/04/2019.
//  Copyright © 2019 Jorge Martin Reyero. All rights reserved.
//

import Foundation
import UIKit

extension HealthyProfileViewController {
    //Delegado del picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       //return self.ages.count
        return self.stringAges.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return self.ages[row] as? String
        return self.stringAges[row]
    }
    
    func pickerView( pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //self.fieldAge.text = self.stringAges[row]
        //self.fieldAge.text = self.example[row]
        
    }
    
  
    
    
    
    
}
