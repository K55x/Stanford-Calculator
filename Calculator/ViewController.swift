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
    
    // set the value and get the value
    var displayValue : Double {
        
        get {
            return Double ( display.text! )!
        }
        
        set {
            display.text = String ( newValue )
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performeOperation(_ sender: UIButton) {
        
        if userIsTyping {
            
            brain.setOperand(displayValue)
            userIsTyping = false
        }
        
        userIsTyping = false
        
        if let symbol = sender.currentTitle {
            
            brain.performOperation(symbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
    
    
    
}

