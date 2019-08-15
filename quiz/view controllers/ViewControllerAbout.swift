//
//  ViewController.swift
//  quiz
//
//  Created by Matthew Fisher on 11/05/2019.
//  Copyright © 2019 Matt Fisher. All rights reserved.
//

import UIKit
class ViewControllerAbout: UIViewController {
    @IBOutlet weak var showAbout: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showAbout.isHidden = true
    }

    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "identHome", sender: self)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            showAbout.isHidden = false
        }
        
        
    }
}
