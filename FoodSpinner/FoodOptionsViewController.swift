//
//  FoodOptionsViewController.swift
//  FoodSpinApp
//
//  Created by Aaron Rudloff 2019 on 5/17/19.
//  Copyright © 2019 Aaron Rudloff. All rights reserved.
//

import UIKit

class FoodOptionsViewController: UIViewController {
    
    //declaring textfields
    @IBOutlet weak var option1: UITextField!
    @IBOutlet weak var option2: UITextField!
    @IBOutlet weak var option3: UITextField!
    @IBOutlet weak var option4: UITextField!
    @IBOutlet weak var option5: UITextField!
    
    //creating food options array
    var foodOptions: [String] = []
    
    //creating food options array label to display options written in textfield
    //(for testing purposes) -> not in final
    @IBOutlet weak var arrayLabel: UILabel!
    
    @IBOutlet weak var spinLabel: UILabel!
    
    
    var output = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    //function for add button
    @IBAction func addButton(_ sender: Any) {
        //adding user inputted food options to array
        foodOptions.append("\(option1.text!)")
        foodOptions.append("\(option2.text!)")
        foodOptions.append("\(option3.text!)")
        foodOptions.append("\(option4.text!)")
        foodOptions.append("\(option5.text!)")
        
        
        option1.resignFirstResponder()
        option2.resignFirstResponder()
        option3.resignFirstResponder()
        option4.resignFirstResponder()
        option5.resignFirstResponder()
        
        //display options from array (for testing purposes)
        for i in 0...4{
            output += "\(foodOptions[i]) "
            if i < 4 {
                output += ", "
            }
        }
        arrayLabel.text = output
    print(foodOptions)
    }
    
    //IDEA is to make it so label updates every 0.1 seconds with a new random string from the array to make it look like it's "spinning" like a carousel through the options
    //Then after a random number of seconds from 3-6 the label will stop updating and the choice will be made
    
    
var counter = 0
    @IBAction func spinButton(_ sender: Any) {
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")
            print(timer)
            self.counter += 1
            
            if self.counter == 6 {
                timer.invalidate()
                
            }
        }
    }

    
    
}
