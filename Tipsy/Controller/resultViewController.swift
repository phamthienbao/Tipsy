//
//  resultViewController.swift
//  Tipsy
//
//  Created by BAO PHAM on 3/23/21.
//

import UIKit

class resultViewController: UIViewController {

    //Define control
    @IBOutlet weak var totalTipLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBAction func recalculateButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var totalTipResult : Float?
    var percent: Int?
    var numofPeople: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTipLabel.text = String(format: "%.2f", totalTipResult!)
        detailsLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        detailsLabel.numberOfLines = 0
        detailsLabel.text = "Split between \(numofPeople!) people with \(percent!)% tips"
        
    }


}

