//
//  DetailViewController.swift
//  SopraSteria
//
//  Created by BMGH SRL on 16/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var blackView: UIView!
    
    @IBOutlet weak var greyView: UIView!
    
    
    @IBAction func actionButtonWasPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 2,
                       options: .curveEaseOut,
                       animations: {
            self.blackView.isHidden = !self.blackView.isHidden
            self.view.layoutIfNeeded()
        }) { (done) in
            UIView.animate(withDuration: 0.5) {
                self.greyView.isHidden = !self.greyView.isHidden
                self.view.layoutIfNeeded()
            }
        }
        
       
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail View Controller"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
