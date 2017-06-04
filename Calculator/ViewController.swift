//
//  ViewController.swift
//  Calculator
//
//  Created by khaled on 9/9/1438 AH.
//  Copyright © 1438 K55xApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping = false
    
    // connect UI With Code
    @IBAction func touchDigit(_ sender: UIButton) {
        
        // get the number title 
        let digit = sender.currentTitle!
        
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
        
        
    }
    
    var displayValue : Double {
        
        get {
                return Double ( display.text! )!
        }
        
        set {
                display.text = String ( newValue )
        }
    }
    
    @IBAction func performeOperation(_ sender: UIButton) {
        
        userIsTyping = false
        
        if let symbol = sender.currentTitle {
            
            switch symbol {
            case "π":
                 displayValue = Double.pi
            case "√":
                displayValue = sqrt( displayValue )
            default:
                break
            }
        }
    }
    
    
    
}

