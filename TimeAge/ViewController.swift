//
//  ViewController.swift
//  TimeAge
//
//  Created by Gianni Casto on 22/06/2020.
//  Copyright © 2020 USBZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    var seconds = 0
    
    //Variables
   
    //Timer
    var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after
        
    }
    @IBAction func start(_ sender: UIButton) {
        timer.invalidate()
        seconds = 0
        secondLabel.text = "\(0)"

        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
        
        
        
    }
    
    @objc fileprivate func count() {
        seconds += 1
        secondLabel.text = "\(seconds)"
    }
    
    
    
    @IBAction func pause(_ sender: UIButton) {
        
        timer.invalidate()
        
        let FloatHeight = Float(secondLabel.text!) ?? 0.0
        
        //secondi caduta^2  x  16.087
        
        //piedi a metro for an approximate result, divide the length value by 3.281
        
        var calcolo1 = FloatHeight * FloatHeight
        
        var calcolo12 = calcolo1 / 100
        
        var calcolo2 = calcolo12 * 16.087
        
        var calcolo3 = calcolo2 / 3.281
        
        let calcolo3Int = Int(calcolo3)
        
        heightLabel.text = "\(calcolo3Int)"
        

    }
   
    @IBAction func reset(_ sender: UIButton) {
        var seconds = 0

        var FloatSecondLabel = Float(heightLabel.text!) ?? 0.0

        secondLabel.text = "\(0)"
        heightLabel.text = "\(0)"
        
        func resetTimes(){
            seconds = 0
            FloatSecondLabel = 0
            seconds = 0
            timer.invalidate()
            
            
           
            
        }

      
        
        
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
 

}
