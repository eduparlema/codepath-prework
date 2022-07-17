//
//  SettingsViewController.swift
//  Prework
//
//  Created by Eduardo Pareja Lema on 7/12/22.
//

import UIKit

class SettingsViewController: UIViewController{
    

    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Save the data in UserDefaults after pressing the button 
    @IBAction func saveData(_ sender: Any) {
        defaults.setValue(tip1TextField.text, forKey: "tip1")
        defaults.setValue(tip2TextField.text, forKey: "tip2")
        defaults.setValue(tip3TextField.text, forKey: "tip3")
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
