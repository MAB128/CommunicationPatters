//
//  ViewController.swift
//  CommunicationPatterns
//
//  Created by mac on 7/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLabel.isHidden = true
        
        //2. Notification - Add Observer
        NotificationCenter.default.addObserver(self, selector: #selector(sideButtonTapped(sender:)), name: Notification.Name("Burger"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sideButtonTapped(sender:)), name: Notification.Name("Pizza"), object: nil)
        
    }

    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        //4. set worker (delegate) to self
        secondVC.worker = self
        
        present(secondVC, animated: true, completion: nil)
    }
    
    
    
    //3. Notification - Expose Method to Obj-C w/ declaration
    @objc func evilTapped() {
        
        firstImage.image = #imageLiteral(resourceName: "burger")
        view.backgroundColor = .red
        firstLabel.isHidden = false
        firstLabel.textColor = .white
        firstLabel.text = "Team Burger"
        
    }
    
    @objc func goodTapped() {
        
        firstImage.image = #imageLiteral(resourceName: "pizza")
        view.backgroundColor = .blue
        firstLabel.isHidden = false
        firstLabel.textColor = .white
        firstLabel.text = "Team Pizza"
        
    }
    
    @objc func sideButtonTapped(sender: Notification) {
        
        let isBurger = sender.name.rawValue == "Burger"
        
        //ternary operator. Left side is true for boolean statement, right side is false
        firstImage.image = isBurger ? #imageLiteral(resourceName: "burger") : #imageLiteral(resourceName: "pizza")
        view.backgroundColor = isBurger ? UIColor.red : UIColor.blue
        firstLabel.isHidden = false
        firstLabel.textColor = .white
        firstLabel.text = isBurger ? "Team Burger" : "Team Pizza"
        
    }
    

    
}

//5. Conform to Protocol
extension FirstViewController: WorkInstructions {
    
    //6. implement the passed infomation from the function
    func passInformation(color: UIColor, name: String, image: UIImage) {
        
        firstImage.image = #imageLiteral(resourceName: "logo")
        view.backgroundColor = color
        firstLabel.isHidden = false
        firstLabel.textColor = .white
        firstLabel.text = name
        
    }
    

}
