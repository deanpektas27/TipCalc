// Dean Pektas
//  ViewController.swift
//  TipCalc
//
//  Created by Dean Pektas on 12/16/18.
//  Copyright © 2018 Dean Pektas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipOptions: UISegmentedControl!
    
   
    
    //gets default value, changes based on settings page changes
    let defaults = UserDefaults.standard
    //using "lazy var" to get past "self" error
    lazy var intValue = defaults.integer(forKey: "myInt")
    lazy var billFieldDef = defaults.string(forKey: "myString")
   //////////////////////////////////////////
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //billField.text = billFieldDef
        
        //billField.becomeFirstResponder()
        tipOptions.selectedSegmentIndex = intValue
        // Do any additional setup after loading the view, typically from a nib.
        view.alpha = 0
        
        //make everything invisible from the start until bill field editing begins
        tipLabel.alpha = 0
        totalLabel.alpha = 0
        tipOptions.alpha = 0
        tipTitleLabel.alpha = 0
        totalTitleLabel.alpha = 0
        
        //When alpha returns to normal, open keyboard
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1
        }) { (Bool) in            self.billField.becomeFirstResponder()
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        tipOptions.selectedSegmentIndex = defaults.integer(forKey: "myInt")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //keyboard can be turned off if tapping empty space (considering removal)
    /*@IBAction func onTap(_ sender: Any) {
        //view.endEditing(true)
    }*/
   
    
    
    //When editing starts, fade everything in
    @IBAction func editingBillChanged(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.billField.transform = CGAffineTransform(translationX: -130, y: 0)
            self.tipTitleLabel.transform = CGAffineTransform(translationX: 0, y: 10)
            self.totalTitleLabel.transform = CGAffineTransform(translationX: 0, y: 10)
            self.tipOptions.transform = CGAffineTransform(translationX: 0, y: 10)
            self.tipLabel.transform = CGAffineTransform(translationX: 0, y: 10)
            self.totalLabel.transform = CGAffineTransform(translationX: 0, y: 10)
            self.tipTitleLabel.alpha = 1
            self.totalTitleLabel.alpha = 1
            self.tipOptions.alpha = 1
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.view.backgroundColor = UIColor.green
            
            })
        
        defaults.set(billField.text, forKey: "myString")
        defaults.synchronize()
        print(billFieldDef)
        
        //If textbox is empty, undo animations and revert alpha
        if billField.text == "" {
            UIView.animate(withDuration: 0.5, animations: {
                self.tipTitleLabel.transform = CGAffineTransform(translationX: 0, y: -10)
                self.totalTitleLabel.transform = CGAffineTransform(translationX: 0, y: -10)
                self.tipOptions.transform = CGAffineTransform(translationX: 0, y: -10)
                self.tipLabel.transform = CGAffineTransform(translationX: 0, y: -10)
                self.totalLabel.transform = CGAffineTransform(translationX: 0, y: -10)
                self.tipTitleLabel.alpha = 0
                self.totalTitleLabel.alpha = 0
                self.tipOptions.alpha = 0
                self.tipLabel.alpha = 0
                self.totalLabel.alpha = 0
                self.billField.transform = CGAffineTransform(translationX: 0, y: 0)
                self.view.backgroundColor = UIColor.white
            })
        }
    }
    
    //////////////////////////////////////////
    
    
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

