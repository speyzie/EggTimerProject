//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
        
        @IBAction func hardnessSelectors(_ sender: UIButton) {
            
            timer.invalidate()
            
            let hardness = sender.currentTitle!
            let result = eggTimes[hardness]!
            
            totalTime = eggTimes[hardness]! * 60
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
        }
    
    @objc func updateTimer() {
        if (totalTime - secondsPassed > 0) {
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            print("\(totalTime - secondsPassed) seconds")
            secondsPassed += 1
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            titleLabel.text = "Done!"
        }
    }
    
        
}
    


