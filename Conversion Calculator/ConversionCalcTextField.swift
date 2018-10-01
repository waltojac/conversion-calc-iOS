//
//  ConversionCalcTextField.swift
//  Conversion Calculator
//
//  Created by Jacob Walton on 10/1/18.
//  Copyright © 2018 Jake Walton. All rights reserved.
//

import UIKit

class ConversionCalcTextField: DecimalMinusTextField {
    override func awakeFromNib() {
        self.textColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.clear
        self.tintColor = FOREGROUND_COLOR
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
        self.borderStyle = .roundedRect
        
        
        guard let ph = self.placeholder else {
            return
        }
        
        self.attributedPlaceholder = NSAttributedString(string: ph, attributes: [NSAttributedStringKey.foregroundColor : FOREGROUND_COLOR])
        
    }

}
