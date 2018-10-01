//
//  ConversionCalcButton.swift
//  Conversion Calculator
//
//  Created by Jacob Walton on 10/1/18.
//  Copyright © 2018 Jake Walton. All rights reserved.
//

import UIKit

class ConversionCalcButton: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = FOREGROUND_COLOR
        self.tintColor = BACKGROUND_COLOR
        self.layer.cornerRadius = 5.0
    }

}
