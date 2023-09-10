//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Michał Rudy on 09/09/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result = ""
    var tip = 0
    var split = 0
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.totalLabel.text = self.result
        self.settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
