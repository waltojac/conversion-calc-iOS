//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by Jacob Walton on 9/17/18.
//  Copyright © 2018 Jake Walton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsViewControllerDelegate {
    @IBOutlet weak var toTextField: DecimalMinusTextField!
    @IBOutlet weak var fromTextField: DecimalMinusTextField!
    @IBOutlet weak var fromUnitLabel: UILabel!
    @IBOutlet weak var toUnitLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var lengthMode: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func unitPickerSelection(toUnit: String, fromUnit: String){
        toUnitLabel.text = toUnit
        fromUnitLabel.text = fromUnit
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        toTextField.text = ""
        fromTextField.text = ""
    }
    @IBAction func fromTapped(_ sender: DecimalMinusTextField) {
        toTextField.text = ""
    }
    @IBAction func toTapped(_ sender: DecimalMinusTextField) {
        fromTextField.text = ""
    }
    
    @IBAction func modeTapped(_ sender: UIButton) {
        if (lengthMode){
            lengthMode = false
            fromUnitLabel.text = VolumeUnit.Liters.rawValue
            toUnitLabel.text = VolumeUnit.Gallons.rawValue
            titleLabel.text = "Volume Conversion Calculator"
        }
        else {
            lengthMode = true
            fromUnitLabel.text = LengthUnit.Yards.rawValue
            toUnitLabel.text = LengthUnit.Meters.rawValue
            titleLabel.text = "Length Conversion Calculator"
        }
        toTextField.text = ""
        fromTextField.text = ""
    }
    
    
    @IBAction func calculate(_ sender: UIButton) {
        //for length mode
        if (lengthMode){
            if (fromTextField.text != ""){
                let toEnum = LengthUnit(rawValue: toUnitLabel.text!)!
                let fromEnum = LengthUnit(rawValue: fromUnitLabel.text!)!
                let convKey =  LengthConversionKey(toUnits: toEnum, fromUnits: fromEnum)
                toTextField.text = String(Double(fromTextField.text!)! * lengthConversionTable[convKey]!);
            }
             else if (toTextField.text != ""){
                let toEnum = LengthUnit(rawValue: fromUnitLabel.text!)!
                let fromEnum = LengthUnit(rawValue: toUnitLabel.text!)!
                let convKey =  LengthConversionKey(toUnits: toEnum, fromUnits: fromEnum)
                fromTextField.text = String(Double(toTextField.text!)! * lengthConversionTable[convKey]!);
            }
        }
            
        // for volume mode
        else {
            if (fromTextField.text != ""){
                let toEnum = VolumeUnit(rawValue: toUnitLabel.text!)!
                let fromEnum = VolumeUnit(rawValue: fromUnitLabel.text!)!
                let convKey =  VolumeConversionKey(toUnits: toEnum, fromUnits: fromEnum)
                toTextField.text = String(Double(fromTextField.text!)! * volumeConversionTable[convKey]!);
            }
            else if (toTextField.text != ""){
                let toEnum = VolumeUnit(rawValue: fromUnitLabel.text!)!
                let fromEnum = VolumeUnit(rawValue: toUnitLabel.text!)!
                let convKey =  VolumeConversionKey(toUnits: toEnum, fromUnits: fromEnum)
                fromTextField.text = String(Double(toTextField.text!)! * volumeConversionTable[convKey]!);
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVC = segue.destination as? UINavigationController
        let settingsVC = navVC?.viewControllers.first as! SettingsViewController
        settingsVC.delegate = self
        settingsVC.lengthMode = self.lengthMode
    }
    
    
}

