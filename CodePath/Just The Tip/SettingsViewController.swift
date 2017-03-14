//
//  SettingsViewController.swift
//  Just The Tip
//
//  Created by Abby Johnson on 3/12/17.
//  Copyright © 2017 Abby Johnson. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let defaults = UserDefaults.standard

    @IBOutlet weak var tipPicker: UIPickerView!

    let pickerData = ["15", "18", "20", "25"]

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "save_settings", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tipPicker.dataSource = self
        tipPicker.delegate = self
        //TODO: load "default_percentage" and set to selected tipPicker row
    }


    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row] + "%"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        defaults.set(pickerData[row], forKey: "default_percentage")
    }


     // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "save_settings" {
            defaults.synchronize()
            print("prepare for segue: 'save_settings'")
        }

    }
}
