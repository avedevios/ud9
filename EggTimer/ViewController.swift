//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var timerSeconds = 0
    var secondsPassed = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessButton(_ sender: UIButton) {
        timer.invalidate()
        
        timerProgressView.progress = 0
        
        
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        
        timerSeconds = eggTimes[hardness]! //* 60
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < timerSeconds {

            secondsPassed += 1
            
            timerProgressView.progress = Float(secondsPassed) / Float(timerSeconds)
            
        } else {
            timer.invalidate()
            
            titleLabel.text = "Done!"
            playSound("alarm_sound")
            
        }
    }
    
    func playSound(_ soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    

}
