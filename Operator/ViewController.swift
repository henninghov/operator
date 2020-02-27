//
//  ViewController.swift
//  Operator
//
//  Created by Henning Hovland on 26/02/2020.
//  Copyright © 2020 Framesby me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AddDeviceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AddDeviceButton.backgroundColor = UIColor.clear
        AddDeviceButton.layer.cornerRadius = 5;
        AddDeviceButton.layer.borderWidth = 1;
        AddDeviceButton.layer.borderColor = UIColor.orange.cgColor;
        
    }
   
    @IBAction func addCamera(_ sender: UIButton) {
        print("Hello")
    }
    
    
}

