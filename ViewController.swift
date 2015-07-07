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
    @IBOutlet weak var display: UILabel!
    var userIsTyping: Bool = false
    
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

}

