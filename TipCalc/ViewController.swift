//
//  ViewController.swift
//  TipCalc
//
//  Created by Dean Pektas on 12/16/18.
//  Copyright © 2018 Dean Pektas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipOptions: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.1, 0.15,0.2]
        
        //convert text to double value,
        //if unrecognizable return def value 0
        let calcValue = Double(billField.text!) ?? 0
        let tip = calcValue * tipPercentages[tipOptions.selectedSegmentIndex]
        let total = calcValue + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

