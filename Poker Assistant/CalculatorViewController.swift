//
//  CalculatorViewController.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/10/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var handOne: String = ""
    var handTwo: String = ""
    var board: String = ""
    
    
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var boardOutlet: UILabel!
    @IBOutlet weak var handOneOutlet: UITextField!
    @IBOutlet weak var handTwoOutlet: UITextField!
    @IBOutlet weak var boardInputOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardOutlet.text = ""
        
        
        
    }
    
    
    func predictOdds(_ handOne: String, _ handTwo: String,_ board: String) -> String {
        
        let result = "50/50 30% of the time"
        
        percent.text = result
        return result
    }
    
    
    
    
    
    
    
    @IBAction func calculate(_ sender: Any) {
        
        predictOdds("AhKh", "6s4s", "5s3sQh")
        
//        percent.text = "result"
        
        // if over 50% make color = green
        
        
        
//        print("---------------------------")
//        print(handTwoOutlet.text?.count, handOneOutlet.text?.count)
        
        if handOneOutlet.text?.count != 4 || handTwoOutlet.text?.count != 4 {
            percent.text = "invalid entry for hand 1 or 2"
        }
        
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        
        //reset
        
        handTwoOutlet.text = ""
        handOneOutlet.text = ""
        percent.text = ""
        boardOutlet.text = ""
    }
    
    
    
    
    
    
}
