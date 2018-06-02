//
//  ViewController.swift
//  Ejemplos_ultima_clase
//
//  Created by MacBookDesarrolloTecno on 2/6/18.
//  Copyright © 2018 Technical PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelStepper: UILabel!
    
    var currentValue:Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        currentValue = Int(sender.value)
        print(sender.value)
        label.text = "\(currentValue)"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "\(Int(slider.value))"
        guard let tabBar = self.tabBarController?.tabBar else { return }
        
        tabBar.tintColor = UIColor.white
        tabBar.barTintColor = UIColor.black
        tabBar.unselectedItemTintColor = UIColor.yellow
        
        
        guard let tabBarItem = self.tabBarItem else { return }
        
        tabBarItem.badgeValue = "123"
        tabBarItem.badgeColor = UIColor.blue
        
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        startButton.layer.shadowRadius = 5
        startButton.layer.shadowOpacity = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func valueChangedStepper(_ sender: UIStepper) {
        labelStepper.text = Int(sender.value).description
    }
    
    @objc func UpdateTimer() {
        counter = counter + 0.1
        timerLabel.text = String(format: "%.1f", counter)
    }
    
    @IBAction func startTimer(_ sender: AnyObject) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: AnyObject) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetTimer(_ sender: AnyObject) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timerLabel.text = String(counter)
    }
    

}

