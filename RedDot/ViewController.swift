//
//  ViewController.swift
//  RedDot
//
//  Created by SEN LIU on 10/13/15.
//  Copyright © 2015 Miku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var dot: RedDot!
    override func viewDidLoad() {
        super.viewDidLoad()
        dot.number = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapButton(sender: AnyObject) {
        if let number = Int(textField.text!) {
            dot.number = number
            dot.setNeedsLayout()
        }
    }

}

