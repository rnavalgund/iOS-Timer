//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Rohit Navalgund on 07/10/17.
//  Copyright © 2017 RNavalgund. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func startTimer(_ sender: Any) {
        if isPlaying {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        //Here, we have a timer which keeps looping until the pause button or reset button is clicked.
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @IBAction func pauseTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    @IBAction func resetTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = true
        
        timer.invalidate()
        isPlaying = false
        counter = 00.00
        timeLabel.text = String(counter)
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    //creating variables to use through the app.
    var counter = 00.00
    var timer = Timer()
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the text of the timer to the same as the counter time. And disable the pauseButton on launch.
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Our timer function for the timer to click-clock every 0.1s (That is every 10ms once.)
    @objc func UpdateTime(){
        counter = counter + 0.10
        timeLabel.text = String(format: "%.1f" , counter)
    }
}
