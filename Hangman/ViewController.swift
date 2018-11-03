//
//  ViewController.swift
//  Hangman
//
//  Created by Helder Pereira on 03.11.18.
//  Copyright © 2018 Hamburg Coding School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func buttonLetterTouched(_ sender: UIButton) {
        print(sender.currentTitle)
    }
}

