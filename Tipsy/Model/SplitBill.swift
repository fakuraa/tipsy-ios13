//
//  SplitBill.swift
//  Tipsy
//
//  Created by Fadil Kurniawan on 19/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


struct SplitBill {
    var total : Float = 0.0
    var person : Int = 2
    var tip : Float = 0.1
    
    mutating func setTip(tip:Float){
        self.tip = tip != 0 ? tip/100 : tip
    }
}
