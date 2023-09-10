//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var tip = "0.0"
    var split = 0.0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        self.zeroPctButton.isSelected = false
        self.tenPctButton.isSelected = false
        self.twentyPctButton.isSelected = false
        
        sender.isSelected = true
        self.tip = sender.currentTitle ?? ""
        
        self.billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        self.splitNumberLabel.text = String(format: "%.0f", sender.value)
        self.split = sender.value
        self.calculatorBrain.setNumberOfPeople(value: sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = self.billTextField.text!
        
        self.calculatorBrain.calculateResult(bill: bill, tip: self.tip, split: self.split)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = self.calculatorBrain.getResult()
            destinationVC.tip = self.calculatorBrain.getTip()
            destinationVC.split = self.calculatorBrain.getSplit()
        }
    }
}

