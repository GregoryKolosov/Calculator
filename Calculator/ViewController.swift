//
//  ViewController.swift
//  Calculator
//
//  Created by Gregory Kolosov on 19/07/2018.
//  Copyright © 2018 Gregory Kolosov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Interface
    // Labels
    @IBOutlet weak var currentOperationLabel: UILabel!
    @IBOutlet weak var saveOperationLabel: UILabel!
    
    // Buttons
    @IBOutlet weak var negative: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButtonn: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var dotButtonn: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    // MARK: - Global Variables
    var number = ""
    var operation = false
    var dot = false
    var secondNumber = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentOperationLabel.text = "0"
        saveOperationLabel.text = "0"
        
        currentOperationLabel.adjustsFontSizeToFitWidth = true
    }

    // MARK: - Buttons Action
    // Numbers 1-9
    @IBAction func buttonPressed(_ sender: UIButton) {
        if currentOperationLabel.text == "0" {
            currentOperationLabel.text = ""
        }
        
        number += "\(sender.tag)"
        currentOperationLabel.text = number
        print(number)
    }
    
    // Number 0
    @IBAction func zeroPressed(_ sender: UIButton) {
        if secondNumber == true {
            number += "0."
            currentOperationLabel.text = number
            secondNumber = false
            dot = true
        } else if currentOperationLabel.text != "0" && secondNumber == false {
            number += "0"
            currentOperationLabel.text = number
        }
    }
    
    // Dot
    @IBAction func dotPressed(_ sender: UIButton) {
        if dot == false {
            if currentOperationLabel.text == "0" {
                dot = true
                number = "0."
                currentOperationLabel.text = number
            } else {
                dot = true
                number += "."
                currentOperationLabel.text = number
            }
        }
    }
    
    @IBAction func plusMinusPressed(_ sender: UIButton) {
        if number.first == "-" {
            number.removeFirst()
            currentOperationLabel.text = number
        } else {
            number = "-" + number
            currentOperationLabel.text = number
        }
    }
    
    
    // Equal
    @IBAction func equalPressed(_ sender: UIButton) {
        math()
    }
    
    // Plus
    @IBAction func plusPressed(_ sender: UIButton) {
        if operation == false {
            number += "+"
            act()
        }
    }
    
    // Subtract
    @IBAction func subtractPressed(_ sender: UIButton) {
        if operation == false {
            number += "-"
            act()
        }
    }
    
    // Divide
    @IBAction func dividePressed(_ sender: UIButton) {
        if operation == false {

            if dot == true {
                number += "/"
                act()
            } else {
                number += ".0/"
                act()
            }
        }
    }
    
    // Multiply
    @IBAction func multiplyPressed(_ sender: UIButton) {
        if operation == false {
            number += "*"
            act()
        }
    }
    
    // Clear
    @IBAction func clearPressed(_ sender: UIButton) {
        clear()
    }
    
    // MATH
    func math() {
        let expression = NSExpression(format: number)
        let mathValue = expression.expressionValue(with: nil, context: nil) as? Double
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        let value = formatter.string(from: NSNumber(value: mathValue!))
        currentOperationLabel.text = value
        saveOperationLabel.text = number
        hideButtons()
    }
    
    // Clear
    func clear() {
        number = ""
        currentOperationLabel.text = "0"
        saveOperationLabel.text = "0"
        operation = false
        dot = false
        secondNumber = false
        showButtons()
    }
    
    func act() {
        currentOperationLabel.text = number
        operation = true
        dot = false
        secondNumber = true
    }
    
    // Hide buttons
    func hideButtons() {
        negative.isHighlighted = true
        negative.isEnabled = false
        
        divideButton.isHighlighted = true
        divideButton.isEnabled = false
        
        multiplyButton.isHighlighted = true
        multiplyButton.isEnabled = false
        
        subtractButton.isHighlighted = true
        subtractButton.isEnabled = false
        
        plusButton.isHighlighted = true
        plusButton.isEnabled = false
        
        oneButton.isHighlighted = true
        oneButton.isEnabled = false
        
        twoButton.isHighlighted = true
        twoButton.isEnabled = false
        
        threeButton.isHighlighted = true
        threeButton.isEnabled = false
        
        fourButton.isHighlighted = true
        fourButton.isEnabled = false
        
        fiveButton.isHighlighted = true
        fiveButton.isEnabled = false
        
        sixButtonn.isHighlighted = true
        sixButtonn.isEnabled = false
        
        sevenButton.isHighlighted = true
        sevenButton.isEnabled = false
        
        eightButton.isHighlighted = true
        eightButton.isEnabled = false
        
        nineButton.isHighlighted = true
        nineButton.isEnabled = false
        
        zeroButton.isHighlighted = true
        zeroButton.isEnabled = false
        
        equalButton.isHighlighted = true
        equalButton.isEnabled = false
    }
    
    // Show buttons
    func showButtons() {
        negative.isHighlighted = false
        negative.isEnabled = true
        
        divideButton.isHighlighted = false
        divideButton.isEnabled = true
        
        multiplyButton.isHighlighted = false
        multiplyButton.isEnabled = true
        
        subtractButton.isHighlighted = false
        subtractButton.isEnabled = true
        
        plusButton.isHighlighted = false
        plusButton.isEnabled = true
        
        oneButton.isHighlighted = false
        oneButton.isEnabled = true
        
        twoButton.isHighlighted = false
        twoButton.isEnabled = true
        
        threeButton.isHighlighted = false
        threeButton.isEnabled = true
        
        fourButton.isHighlighted = false
        fourButton.isEnabled = true
        
        fiveButton.isHighlighted = false
        fiveButton.isEnabled = true
        
        sixButtonn.isHighlighted = false
        sixButtonn.isEnabled = true
        
        sevenButton.isHighlighted = false
        sevenButton.isEnabled = true
        
        eightButton.isHighlighted = false
        eightButton.isEnabled = true
        
        nineButton.isHighlighted = false
        nineButton.isEnabled = true
        
        zeroButton.isHighlighted = false
        zeroButton.isEnabled = true
        
        equalButton.isHighlighted = false
        equalButton.isEnabled = true
    }
  
} // E N D

