//
//  GameViewController.swift
//  quiz
//
//  Created by Matthew Fisher on 11/05/2019.
//  Copyright © 2019 Matt Fisher. All rights reserved.
//

//import Foundation
import UIKit
import SpriteKit

class GameViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size : view.bounds.size)
        let skView = view as! SKView
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }

}

