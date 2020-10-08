//
//  ViewController.swift
//  Timer
//
//  Created by hyu on R 2/07/29.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var settingButton: UIBarButtonItem!
    
    var timer: Timer?
    var count = 0
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey: 10])
        
    }
    
    @IBAction func settingAction(_ sender: Any) {
        
        if let nowTimer = timer{
            if nowTimer.isValid == true{
                nowTimer.invalidate()
            }
        }
        
        performSegue(withIdentifier: "goSetting", sender: nil)
        
        
    }
    @IBAction func startAction(_ sender: UIButton) {
        
        if let nowTimer = timer{
            if nowTimer.isValid == true{
                return
            }
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerInterrupt(timer:)), userInfo: nil, repeats: true)
        
        
    }
    @IBAction func stopAction(_ sender: UIButton) {
        
        if let nowTimer = timer{
            if nowTimer.isValid == true{
                nowTimer.invalidate()
            }
        }
    }
    
    @objc func timerInterrupt(  timer:Timer){
        
        count += 1
        if displayUpdate() <= 0 {
            count = 0
            timer.invalidate()
        }
    }
    func displayUpdate() -> Int{
        let setting = UserDefaults.standard
        let timeValue = setting.integer(forKey:settingKey)
        let remainCount = timeValue - count
        display.text = "残り\(remainCount)秒"
        return remainCount
    }
}

