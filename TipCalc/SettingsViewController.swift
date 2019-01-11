//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Dean Pektas on 12/17/18.
//  Copyright © 2018 Dean Pektas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //var mainViewController:ViewController?
  
    //Access UserDefaults to change value
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var defTipOption: UISegmentedControl!
    lazy var intValueDef = defaults.integer(forKey: "myInt")
    
    @IBAction func defTipOptionChanged(_ sender: UISegmentedControl) {
        
        defaults.set(defTipOption.selectedSegmentIndex, forKey: "myInt")
        
        //force UserDefaults to save
        defaults.synchronize()
        
        //checking for segmentedControl changes in console
        print(defaults)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defTipOption.selectedSegmentIndex = intValueDef
        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
