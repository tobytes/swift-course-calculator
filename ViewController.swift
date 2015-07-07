//
//  ViewController.swift
//  Calculator
//
//  Created by Tobias Reinwarth on 25.06.15.
//  Copyright (c) 2015 Tobias Reinwarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // UILabel is an optional and is automatically nil
    // Exlamation point tells, that this is an implicitly
    // unwrapped optional
    @IBOutlet weak var display: UILabel!
    var userIsTyping = false
    var operandStack = Array<Double>()
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
    
    
    @IBAction func appendDigit(sender: UIButton)
    {
        let digit = sender.currentTitle!
        if userIsTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
        println("digit= \(digit)")
        
    }


    @IBAction func enter()
    {
        userIsTyping = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton)
    {
        let operation = sender.currentTitle!
        if userIsTyping {
            enter()
        }
        switch operation {
            case "×":
                performOperation { $0 * $1 }
            case "÷":
                performOperation { $1 / $0 }
            case "−":
                performOperation { $1 - $0 }
            case "+":
                performOperation { $0 + $1 }
            case "√":
                performOperation { sqrt($0) }

        default: break
        }
        
    }
    func performOperation(operation: (Double, Double) -> Double ) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    private func performOperation(operation: Double -> Double ) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
}

