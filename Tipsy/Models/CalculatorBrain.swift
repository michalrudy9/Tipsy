//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Michał Rudy on 09/09/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var resultModel: Result?
    
    var tip = 0.0
    var numberOfPeople = 0
    var billTotal = 0.0
    var finalResult = "0.0"
    
    mutating func calculateResult(bill: String?, tip: String, split: Double) {
        if tip != "" {
            let buttonTitle = tip
            let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
            let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
            self.tip = buttonTitleAsNumber / 100
        }
        
        if bill != "" {
            self.billTotal = Double(bill!)!
            let result = billTotal * (1 + self.tip) / Double(numberOfPeople)
            self.resultModel?.result = String(format: "%.2f", result)
            self.finalResult = String(format: "%.2f", result)
        }
        
        self.resultModel = Result(result: self.finalResult, tip: Int(self.tip * 100), split: self.numberOfPeople)
    }
    
    func getResult() -> String {
        return resultModel?.result ?? "0.0"
    }
    
    func getTip() -> Int {
        return resultModel?.tip ?? 0
    }
    
    func getSplit() -> Int {
        return resultModel?.split ?? 0
    }
    
    mutating func setNumberOfPeople(value: Double) {
        self.numberOfPeople = Int(value)
    }
}
