//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Fadil Kurniawan on 19/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var splitit : SplitBill?
    @IBOutlet weak var settLabel: UILabel!
    @IBOutlet weak var totalPerson: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerson.text = "\(splitit?.total ?? 0)"
        settLabel.text = "Split between \(String(format: "%.2f",splitit?.person ?? 0)) people, with \(Int((splitit?.tip ?? 0)*100))% tip."
    }
    
    @IBAction func RecallPressed(_ sender: UIButton) {
        dismiss(animated: true)
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
