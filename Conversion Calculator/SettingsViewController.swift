//
//  SettingsViewController.swift
//  Conversion Calculator
//
//  Created by Jacob Walton on 9/21/18.
//  Copyright © 2018 Jake Walton. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func unitPickerSelection(toUnit: String, fromUnit: String)
}

class SettingsViewController: UIViewController {
   
    @IBOutlet weak var fromUnitLabel: UILabel!
    @IBOutlet weak var toUnitLabel: UILabel!
    
    var fromU: String = ""
    var toU: String = ""
    
    var selectedLabel: String = "from"
    var lengthMode: Bool?
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var choice: String = ""             //Maybe need to fill
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (lengthMode == true){
            for each in LengthUnit.allCases{
                self.pickerData.append(each.rawValue)
            }
        }
        else {
            for each in VolumeUnit.allCases{
                self.pickerData.append(each.rawValue)
            }
        }
        self.picker.delegate = self
        self.picker.dataSource = self
        self.fromUnitLabel.text = fromU
        self.toUnitLabel.text = toU
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func transferUnits(toUnit: String, fromUnit: String) {
        toUnitLabel.text = toUnit
        fromUnitLabel.text = fromUnit
    }

    // MARK: - Navigation
    

    @IBAction func fromUnitTapped(_ sender: UITapGestureRecognizer) {
        selectedLabel = "from"
        picker.isHidden = false;
    }
    
    @IBAction func toUnitTapped(_ sender: UITapGestureRecognizer) {
        selectedLabel = "to"
        picker.isHidden = false;
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        _  = self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if let d = self.delegate {
            d.unitPickerSelection(toUnit: toUnitLabel.text!, fromUnit: fromUnitLabel.text!)
        }
        _ = self.navigationController?.popViewController(animated: true)
    }

    
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (selectedLabel == "from"){
            fromUnitLabel.text = self.choice
        }
        else{
            toUnitLabel.text = self.choice
        }
        picker.isHidden = true
        
    }
    
    
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.choice = self.pickerData[row]
    }
}
