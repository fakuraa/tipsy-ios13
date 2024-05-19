//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var txtSplitNum: UILabel!
    @IBOutlet weak var btn0Pct: UIButton!
    @IBOutlet weak var btn10pct: UIButton!
    @IBOutlet weak var btn20Pct: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var txtBill: UITextField!
    
    var splitit = SplitBill()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pctPress(_ sender: UIButton) {
        let selBtn = sender.titleLabel?.text?.replacingOccurrences(of: "%", with: "")
        splitit.setTip(tip: Float(selBtn ?? "0") ?? 0.0)
        updatePctBtn(pct0:selBtn=="0" , pct10: selBtn=="10", pct20: selBtn=="20")
    }
    
    func updatePctBtn(pct0:Bool, pct10:Bool, pct20:Bool){
        btn0Pct.isSelected = pct0
        btn10pct.isSelected = pct10
        btn20Pct.isSelected = pct20
    }
    
    @IBAction func stepPress(_ sender: UIStepper) {
        txtSplitNum.text = String(format:"%.0f",Float(sender.value))
    }
    
    @IBAction func calculatePress(_ sender: UIButton) {
        var bill : Float = Float(txtBill.text ?? "0") ?? 0.0
        let split : Float = Float(txtSplitNum.text ?? "0") ?? 0.0
        var total = (bill + (bill*splitit.tip)) / split
        splitit = SplitBill(total:total,person: Int(split),tip: splitit.tip)
        self.performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showResult"){
            let destination = segue.destination as! ResultViewController
            destination.splitit = splitit
        }
    }
}

