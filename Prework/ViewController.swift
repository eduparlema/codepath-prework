//
//  ViewController.swift
//  Prework
//
//  Created by Eduardo Pareja Lema on 7/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    

    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip calculator"
        
    
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Retrieve data from UserDefaults and update the tipControl labels
        if let tipControl1 = defaults.value(forKey: "tip1") as? String{
            tipControl.setTitle(String(tipControl1)+"%", forSegmentAt:0)
        }
        if let tipControl2 = defaults.value(forKey: "tip2") as? String{
            tipControl.setTitle(tipControl2+"%", forSegmentAt:1)
        }
        if let tipControl3 = defaults.value(forKey: "tip3") as? String{
            tipControl.setTitle(tipControl3+"%", forSegmentAt:2)
        }
        //if let blackColor = defaults.value(forKey: "black") as? UIColor{
        //    self.view.backgroundColor = blackColor
        //}

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.keyboardType = .asciiCapableNumberPad
        billAmountTextField.becomeFirstResponder()
    }
    
    
    
    @IBAction func calculateTip(_ sender: Any) {

        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        var tipPercentage1 = 0.0
        var tipPercentage2 = 0.0
        var tipPercentage3 = 0.0
        
        //Make the input of the user a Double so we can calculate the tip and the total
        if let tip1 = defaults.value(forKey: "tip1") as? String{
            tipPercentage1 = (Double(tip1)!/100)
        }
        if let tip2 = defaults.value(forKey: "tip2") as? String{
            tipPercentage2 = Double(tip2)!/100
        }
        if let tip3 = defaults.value(forKey: "tip3") as? String{
            tipPercentage3 = Double(tip3)!/100
        }
        
        let tipPercentages = [tipPercentage1, tipPercentage2,
                              tipPercentage3]
        
        //Get total tip by multiplying tip * tip percentage
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func Reset(_ sender: Any) {
        // Reset the labels when the button is pressed
        
        tipAmountLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
   
    
}

