//
//  ThirdViewController.swift
//  CommunicationPatterns
//
//  Created by Consultant on 7/12/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    //2. declare worker (delegate) to pass information
    weak var worker2: WorkInstructions?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
}
    @IBAction func acceptButtonTapped(_ sender: UIButton) {
        
        //Notification Pattern - One to Many Communication
        
        //Option 1 Notification
        NotificationCenter.default.post(name: Notification.Name("Accept"), object: nil)
        
        dismiss(animated: true, completion: nil)
        
        
        //MARK: MOVE TO NEXT VIEW, Remove LINE ABOVE WHEN ACTIVATED
        
        /*
         let secondVC = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        
        //4. set worker (delegate) to self
        secondVC.worker = self
        
        present(secondVC, animated: true, completion: nil)
         */
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        //Option 2 Notification
        NotificationCenter.default.post(name: Notification.Name("Cancel"), object: nil)
        
        dismiss(animated: true, completion: nil)
        
        //MARK:Move to prev Controller, remove above line when activated
/*
         let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
 
         //4. set worker (delegate) to self
         secondVC.worker = self
         present(secondVC, animated: true, completion: nil)
 */
        
    }
    
    
    
}
