//
//  TipCore.swift
//  Tipsy
//
//  Created by BAO PHAM on 3/23/21.
//

import UIKit

struct TipCore {
    var billNumber : Float?
    var tipsPercent : Int?
    var splitNumber : Int?

    mutating func getTipPercent(tipsSelect: String) -> Int {
        if tipsSelect == "0%"{
            tipsPercent = 0
        } else if tipsSelect == "10%" {
            tipsPercent = 10
        } else if tipsSelect == "20%" {
            tipsPercent = 20
        }
        return tipsPercent!
    }
        
    func calculateTips(billTotal: Float, numPercent: Int, numSplit: Int) -> Float {
        let percent = billTotal + ((billTotal * Float(numPercent))/100)
        return (percent / Float(numSplit))
    }
    
}
