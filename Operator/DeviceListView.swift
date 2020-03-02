//
//  DeviceListView.swift
//  Operator
//
//  Created by Henning Hovland on 02/03/2020.
//  Copyright © 2020 Framesby me. All rights reserved.
//

import UIKit
import Rocc

class DeviceListView: UIView, CameraDiscovererDelegate {
    
    var cameraList = [] as [Any]
    let cameraDiscoverer = CameraDiscoverer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width

        self.frame =  CGRect(x: 0, y: 0, width: screenWidth, height: 350)
        cameraDiscoverer.delegate = self
            
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //common func to init our view
    private func setupView() {

    }
    func deviceScan(){
        print("Start Scan")
        let cameraObject = ["name ": "ɑ9", "manufacturer": "Sony Corporation", "model": "ɑ9", "id": "uuid:00000000-0000-0010-8000-60f189adcccf"]
        cameraList.append(cameraObject);
        print(cameraList)
        //cameraDiscoverer.start()
    }
    func cameraDiscoverer(_ discoverer: CameraDiscoverer, didError error: Error) {
        // Called with errors, these do happen a lot so you will want to check the error code and type here before displaying!
        print("Device Dicovery in Progress")
    }
        
    func cameraDiscoverer(_ discoverer: CameraDiscoverer, discovered device: Camera) {
        print("1. Device Discovered Device List")
        // Connect to the device!
        print(cameraDiscoverer)
        
        let manufacturer = device.manufacturer
        let model: String = device.model!
        let name: String = device.name!
        //let ip: String = device.ipAddress
        let id = device.identifier
        
        let cameraObject: [String: Any] = [
            "id" : id,
            "manufacturer" : manufacturer,
            "model": model,
            "name ": name,
        ]
 
        cameraList.append(cameraObject);
        
        
        //connect(to: device)
    }
    
    func connect(to camera: Camera) {
        camera.connect { (error, isInTransferMode) in
            print("2. Device Connected  Device List")
            // isInTransferMode reflects whether the camera was already connected
            // to and has been re-connected to whilst in "Contents Transfer" mode.
            
        }
    }
}
