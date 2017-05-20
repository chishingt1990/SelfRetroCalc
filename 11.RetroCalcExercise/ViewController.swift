//
//  ViewController.swift
//  11.RetroCalcExercise
//
//  Created by Shuang Wu on 17/05/2017.
//  Copyright © 2017 Shuang Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!

    var leftVariable = ""
    var rightVariable = ""
    var runningNumber = ""
    var result = ""
    var currentOperation = ""
    
    @IBAction func buttonPressed (btn:UIButton!){
        runningNumber += "\(btn.tag)"
        outputLabel.text = runningNumber
    }

    @IBAction func clearPressed (op:UIButton!){
        runningNumber = ""
        leftVariable = ""
        rightVariable = ""
        result = ""
        currentOperation = ""
        outputLabel.text = runningNumber
    }
    
    @IBAction func addPressed (op:UIButton!){
            processOperation(op:"Add")
    }
    
    @IBAction func minusPressed (op:UIButton!){
            processOperation(op:"Minus")
    }
    
    @IBAction func multiplyPressed (op:UIButton!){
            processOperation(op:"Multiply")
    }
    
    @IBAction func dividePressed (op:UIButton!){
            processOperation(op:"Divide")
    }
    
    @IBAction func equalPressed (op:UIButton!){
        processOperation(op:currentOperation)
    }
    
    func processOperation (op:String){
        if currentOperation != "" {
            rightVariable = runningNumber
            
            if runningNumber != ""{
                if currentOperation == "Add" {
                    result = "\((Double(leftVariable)! + Double(rightVariable)!))"
                }
                else if currentOperation == "Minus" {
                    result = "\((Double(leftVariable)! - Double(rightVariable)!))"
                }
                else if currentOperation == "Multiply" {
                    result = "\((Double(leftVariable)! * Double(rightVariable)!))"
                }
                else if currentOperation == "Divide" {
                    result = "\((Double(leftVariable)! / Double(rightVariable)!))"
                }
            }
            currentOperation = op
            outputLabel.text = result
            leftVariable = result
            runningNumber = ""
        }
        else {
            leftVariable = runningNumber
            currentOperation = op
            runningNumber = ""
        }
        
    }
    
    
}

