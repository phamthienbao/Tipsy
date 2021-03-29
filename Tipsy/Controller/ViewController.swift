//
//  ViewController.swift
//  Tipsy
//
//  Created by BAO PHAM on 3/17/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //define control
    @IBOutlet weak var billTotalTextField: UITextField!
    @IBOutlet weak var splitTextField: UILabel!
    @IBOutlet weak var tipZeroButton: UIButton!
    @IBOutlet weak var tipTenButton: UIButton!
    @IBOutlet weak var tipTwentyButton: UIButton!
        
    
    var tipCore = TipCore()
    var totalTip : Float?
    var tipSelected: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        splitTextField.text = "1"
        //hit outside to dismiss
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap) // Add gesture recognizer to background view
        
        self.billTotalTextField.delegate = self

        
    }
    
    //handle hit outside to dismiss keyboard
    @objc func handleTap() {
        billTotalTextField.resignFirstResponder() // dismiss keyoard
    }
    
    //handle it return to dismiss keyboard
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            billTotalTextField.resignFirstResponder() // dismiss keyboard
            return true
        }

    
    @IBAction func billTextFieldChanged(_ sender: UITextField) {
        
    }
    @IBAction func tipPercentSelect(_ sender: UIButton) {
        tipZeroButton.backgroundColor = UIColor.clear
        tipTenButton.backgroundColor = UIColor.clear
        tipTwentyButton.backgroundColor = UIColor.clear
        
        if sender.isTouchInside == true {
            sender.backgroundColor = UIColor.cyan
            tipSelected = sender.currentTitle
        }
        tipCore.tipsPercent = tipCore.getTipPercent(tipsSelect: tipSelected!)

    }
    
    
    @IBAction func splitStepber(_ sender: UIStepper) {

        splitTextField.text = Int(sender.value).description
    }
    
    func displayAlert(){
            // Create Alert
        let dialogMessage = UIAlertController(title: "Please check again!", message: "You need enter more information to calculate a tips", preferredStyle: .alert)
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default)
            //Add OK and Cancel button to an Alert object
            dialogMessage.addAction(ok)
            // Present alert message to user
            self.present(dialogMessage, animated: true, completion: nil)
        }

    
    @IBAction func calculateButton(_ sender: Any) {
        
        if (billTotalTextField.text == "") || tipCore.tipsPercent == nil {
            displayAlert()

        } else {
            tipCore.billNumber = Float(billTotalTextField.text!)
            tipCore.splitNumber = Int(splitTextField.text!)
            totalTip = tipCore.calculateTips(billTotal: tipCore.billNumber!, numPercent: tipCore.tipsPercent!, numSplit: tipCore.splitNumber!)
            self.performSegue(withIdentifier: "gotoResult", sender: self)

        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "gotoResult" {
                let destinationVC = segue.destination as! resultViewController
                destinationVC.totalTipResult = totalTip
                destinationVC.numofPeople = tipCore.splitNumber
                destinationVC.percent = tipCore.tipsPercent
                
            }
    }

    
    
}

