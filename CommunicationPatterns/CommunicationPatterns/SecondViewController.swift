//
//  SecondViewController.swift
//  CommunicationPatterns
//
//  Created by mac on 7/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

//Delegation Pattern - One to One communication
//gives an object that ability to carry out pieces of functionality from another object

//1 - Protocol
protocol WorkInstructions: class {
    
    func passInformation(color: UIColor, name: String, image: UIImage)
    
}

class SecondViewController: UIViewController {

    //2. declare worker (delegate) to pass information
    weak var worker: WorkInstructions?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func evilButtonTapped(_ sender: UIButton) {
        
        //3. call the worker's function
//        worker?.passInformation(color: .red, name: "Team Frieza", image: UIImage(named: "frieza")!)
        
        
         //Notification Pattern - One to Many Communication
        
        //1. Post Notification
        NotificationCenter.default.post(name: Notification.Name("Burger"), object: nil)
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func goodButtonTapped(_ sender: UIButton) {
        
//        worker?.passInformation(color: .blue, name: "Team Vegeta", image: #imageLiteral(resourceName: "vegeta"))
        
        //1. Post Good Notification
        NotificationCenter.default.post(name: Notification.Name("Pizza"), object: nil)
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
