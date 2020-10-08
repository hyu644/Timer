//
//  SettingViewController.swift
//  Timer
//
//  Created by hyu on R 2/07/29.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import SwiftUI


class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var PickDataView: UIPickerView!
    @IBOutlet weak var PickDataButton: UIButton!
    
    let settingArray : [Int] = [10,20,30,40,50,60]
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.PickDataView.delegate = self
        self.PickDataView.dataSource = self
        
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                PickDataView.selectRow(row, inComponent: 0, animated: true)
            }
        }
    }
    
    @IBAction func PickerDataSetAction(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settingArray[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let setting = UserDefaults.standard
        setting.setValue(settingArray[row], forKeyPath: settingKey)
        setting.synchronize()
    }
}
