//
//  CameraViewController.swift
//  Operator
//
//  Created by Henning Hovland on 27/02/2020.
//  Copyright © 2020 Framesby me. All rights reserved.
//

import UIKit
import Rocc



class CameraViewController: UIViewController, CameraDiscovererDelegate {

    
    let cameraDiscoverer = CameraDiscoverer()
   

    
    
    @IBOutlet weak var addCameraView: UIView!
    @IBOutlet weak var AddDeviceButton: UIButton!;
    
    @IBOutlet weak var CancelDeviceButton: UIButton!
    
    
    @IBOutlet weak var addCameraConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AddDeviceButton.backgroundColor = UIColor.clear
        AddDeviceButton.layer.cornerRadius = 5;
        AddDeviceButton.layer.borderWidth = 1;
        AddDeviceButton.layer.borderColor = UIColor.orange.cgColor;
        
        
        CancelDeviceButton.backgroundColor = UIColor.clear
        CancelDeviceButton.layer.cornerRadius = 5;
        CancelDeviceButton.layer.borderWidth = 1;
        CancelDeviceButton.layer.borderColor = UIColor.orange.cgColor;
        
        CancelDeviceButton.isHidden = true;
        
        cameraDiscoverer.delegate = self
                
        view.layoutIfNeeded()

        
        
    }
    

    
    @IBAction func addCamera(_ sender: UIButton) {
        
        AddDeviceButton.isHidden = true
        CancelDeviceButton.isHidden = false;
        
        UIView.animate(withDuration: 0.3,
        delay: 0.0,
        options: [],
        animations: {
            self.addCameraView.layer.zPosition = 2;
            self.addCameraConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
        },
        completion:  nil)
            
        //cameraDiscoverer.start()
        
        
        
    }
    
    @IBAction func cancelDeviceScan(_ sender: UIButton) {
        
        AddDeviceButton.isHidden = false
        CancelDeviceButton.isHidden = true;
        
        UIView.animate(withDuration: 0.3,
        delay: 0.0,
        options: [],
        animations: {
        
            //self.addCameraView.frame.origin.x = 0
            self.addCameraConstraint.constant -= self.view.bounds.width
            self.view.layoutIfNeeded()
            
        },
        completion:  nil)
    
    }
        
    
    func cameraDiscoverer(_ discoverer: CameraDiscoverer, didError error: Error) {
        // Called with errors, these do happen a lot so you will want to check the error code and type here before displaying!
        print("Device Dicovery in Progress")
    }
        
    func cameraDiscoverer(_ discoverer: CameraDiscoverer, discovered device: Camera) {
        print("1. Device Discovered")
        // Connect to the device!
        print(device)
       //connect(to: device)
    }
    
    func connect(to camera: Camera) {
        camera.connect { (error, isInTransferMode) in
            print("2. Device Connected")
            // isInTransferMode reflects whether the camera was already connected
            // to and has been re-connected to whilst in "Contents Transfer" mode.
            
            
        }
    }
    
}



