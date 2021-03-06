//
//  ViewController.swift
//  NumberLock
//
//  Created by 呂宗昇 on 2017/11/28.
//  Copyright © 2017年 TSL. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    //make a random number
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    //change statubar to white
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    @IBOutlet weak var authorMessage: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        
        if isOver == false{
            print(answer)
            //take input text out
            let inputText = inputTextField.text!
            //clear textfield
            inputTextField.text = ""
            let inputNumber = Int(inputText)
            
            if inputNumber == nil{
                //input error
                messageLabel.text = "No input! Guess a number between \(minNumber)~\(maxNumber)"
            }else{
                //input success
                if inputNumber! > 100{
                    //user input too large
                    messageLabel.text = "Too large! Guess a number between \(minNumber)~\(maxNumber)"
                }else if inputNumber! < 1{
                    //user input too small
                    messageLabel.text = "Too small! Guess a number between \(minNumber)~\(maxNumber)"
                }else if inputNumber! == answer{
                    // user input right
                    messageLabel.text = "You are right,press the [Guess] can play again "
                    isOver = true
                    background.image = UIImage(named: "Finish")
                }else{
                    // user inpyt error
                    if inputNumber! > answer{
                        maxNumber = inputNumber!
                        messageLabel.text = "Guess a number between \(minNumber)~\(maxNumber)"
                    }else{
                        minNumber = inputNumber!
                        messageLabel.text = "Guess a number between \(minNumber)~\(maxNumber)"
                    }
                    messageLabel.text = "Guess a number between \(minNumber)~\(maxNumber)"
                }
            }
        }else{
            maxNumber = 100
            minNumber = 1
            
            messageLabel.text = "Guess a number between \(minNumber)~\(maxNumber)"
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            isOver = false
            background.image = UIImage(named: "BG")
        }
        //The area is for git controll
        print("Hello Git")
        authorMessage.text = "TSL"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //push the keyboard on
        inputTextField.becomeFirstResponder()
        
        func makeChange(text:String)->String{
            
            return String(text.reversed())
            
        }
        print(makeChange(text: "stressed"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

