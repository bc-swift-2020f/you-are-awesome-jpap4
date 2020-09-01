//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by John Pappas on 9/1/20.
//  Copyright © 2020 John Pappas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🤙 viewDidLoad has run")
        messageLabel.text = "Fabulous? That's You!"
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        print("😎 The message button was pressed")
        messageLabel.text = "You Are Awesome!"
    }
}

