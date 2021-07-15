//
//  ViewController.swift
//  Scrabeater
//
//  Created by Hamzah Gopaul on 31/08/2020.
//  Copyright © 2020 Hamzah Gopaul. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = K.appName
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.2*charIndex, repeats: false) {(timer) in
                self.titleLabel.text?.append(letter)
                if self.titleLabel.text?.count == 12 {
                    self.performSegue(withIdentifier: "goToWordInput", sender: self)
                }            }
            charIndex += 1
        }
        
        

    }
}
