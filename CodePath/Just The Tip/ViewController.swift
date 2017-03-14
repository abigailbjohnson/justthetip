//
//  ViewController.swift
//  Just The Tip
//
//  Created by Abby Johnson on 2/23/17.
//  Copyright © 2017 Abby Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var eachLabel: UILabel!

    let tipPercentageValues = [0.15, 0.18, 0.2, 0.25]
    let customerSplit = [1.0, 2.0, 3.0]

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        eachLabel.isHidden = true

        //TODO: Check for default "tip_percentage" & set tipControl.selectedSegmentIndex as needed
    }

    @IBAction func calculateTip(_ sender: AnyObject) {

        print("calculateTip: billValue = \(billField.text)")

        // only show "each" label if split between > 1 person
        eachLabel.isHidden = splitControl.selectedSegmentIndex == 0 ? true : false

        let bill = Double(billField.text!) ?? 0
        let splitBill = bill / customerSplit[splitControl.selectedSegmentIndex]
        let tip = splitBill * tipPercentageValues[tipControl.selectedSegmentIndex]
        let total = splitBill + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func myUnwindAction(segue: UIStoryboardSegue) {

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
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
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

}

//extension ViewController {
//
//    var defaultPercentage: Double {
//        get {
//            return defaults.double(forKey: defaultPercentageKey)
//        }
//        set {
//            defaults.set(newValue, forKey: defaultPercentageKey)
//        }
//    }
//}

