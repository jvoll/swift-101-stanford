//
//  ViewController.swift
//  Calculator
//
//  Created by Jason Voll on 2015-07-08.
//  Copyright (c) 2015 Jason Voll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var currentlyEnteringNumbers = false
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if currentlyEnteringNumbers {
            display.text = display.text! + digit
        } else {
            display.text = digit
            currentlyEnteringNumbers = true
        }

        print("number pressed = \(digit)")
        
        
    }
    
//    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        currentlyEnteringNumbers = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0 // error case not handled well yet
        }
        
//        operandStack.append(displayValue)
//        println("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            currentlyEnteringNumbers = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
//        let operation = sender.currentTitle!
        if currentlyEnteringNumbers {
            enter()
        }
        
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }   
        }
        
//        switch operation {
//            case "✕": performOperation { $0 * $1 }
//            case "÷": performOperation { $1 / $0 }
//            case "+": performOperation { $0 + $1 }
//            case "−": performOperation { $1 - $0 }
//            case "√": performOperation { sqrt($0) }
//            default: break
//        }
    }
    
//    private func performOperation(operation: (Double, Double) -> Double) {
//        if operandStack.count >= 2 {
//            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
//            enter()
//        }
//    }
//    
//    private func performOperation(operation: Double -> Double) {
//        if operandStack.count >= 1 {
//            displayValue = operation(operandStack.removeLast())
//            enter()
//        }
//    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

