//
//  GameScene.swift
//  quiz
//
//  Created by Matthew Fisher on 11/05/2019.
//  Copyright © 2019 Matt Fisher. All rights reserved.
//

//import Foundation
import SpriteKit
import AVFoundation
import GameplayKit

class GameScene : SKScene, SKPhysicsContactDelegate  {
    //boolean game start
    var gameStart = true
    //setting up time frame setting to 0
    var timerFrame = 0
    //creating cell as SkSpritenode
    var cell = SKSpriteNode()
    //create antivurs as SkSpritenode
    var antiVirus = SKSpriteNode()
    //create virus as SkSpritenode
    var virus = SKSpriteNode()
    //create score lable as SKlableNode
    var scoreLabel = SKLabelNode()
    //set score count to zero and create score count
    var scoreCount = 0
    //create an array of skSprite nodes 
    var arrayVirus :[SKSpriteNode] = [SKSpriteNode]()
    let virusCategory:UInt32 = 0x1 << 0;
    let cellCategory:UInt32 = 0x1 << 2;
    let antiVirusCategory:UInt32 = 0x1 << 1;
    let sound = SKAction.playSoundFileNamed("music.mp3", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        gameStart = true
        self.physicsWorld.contactDelegate = self
        self.backgroundColor = UIColorFromRGB(rgbValue: 0x521414)
        cellSpawn()
        score()
        bloodFlowAnimation()
        run(sound)
    }
    
    func cellSpawn()
        //setting cell image to Antivirus main in images folder
        //z postion of the mage set to 2 size and width of image set and to be
        //setting  the physics properties
        //adding the node to the scence
    {
        cell = SKSpriteNode(imageNamed: "AntivirusMain")
        cell.zPosition = 2
        cell.size = CGSize(width: 200, height: 200)
        cell.position = CGPoint(x: frame.midX, y: frame.midY)
        cell.physicsBody = SKPhysicsBody(circleOfRadius: cell.size.width / 2)
        cell.physicsBody?.isDynamic = false
        cell.physicsBody?.categoryBitMask = cellCategory
        cell.physicsBody?.contactTestBitMask = cellCategory
        self.addChild(cell)
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        if timerFrame == 30
        {
            if gameStart == true{
            spawnVirus()
            timerFrame = 0
            }
        }
        else{
            timerFrame = timerFrame + 1
        }
    }
    
    func score(){
        //setting the score if a node is hit
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        scoreLabel.zPosition = 3
        scoreLabel.fontSize = 33
        scoreLabel.fontName = "chalkboard SE"
        scoreLabel.fontColor = .black
        self.addChild(scoreLabel)
    }
    func endGame(){
        //if game method is called set game over to false
        gameStart = false
        //print over
        print("over")
        //make an alert box peinting the socre whihc is passed by the variable of the scorelabel
        let gameOver = UIAlertController(title: "You Died!", message:"Thanks for playing your score was \(scoreCount)", preferredStyle: .alert)
        //takes the user back home through the sauge controller using the home identifues which is setup on the storybaord
        let goHome = UIAlertAction(title: "Back Home!", style: .default) { (_) -> Void in
            let me = UIStoryboard(name: "Main", bundle: nil)
            let vc = me.instantiateViewController(withIdentifier: "home")
            self.view?.window?.rootViewController?.present(vc, animated: false, completion:nil)
        }
        //calling variables
        gameOver.addAction(goHome)
        self.view?.window?.rootViewController?.present(gameOver, animated: true, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        //if the screen touched make the antivirus node a postion to a vector
        //thoguout a duration dynamic is false and gravity is false
        //setting  the physics properties
        //adding the node to the scence
        //setting the image
        //running the squence by each vector updating and removing itslef as it moves
        let touchLocation = touch.location(in: self)
        antiVirus = SKSpriteNode(imageNamed: "Antivirus")
        antiVirus.position = cell.position
        antiVirus.size = CGSize(width: 40, height: 40)
        let k:CGFloat=5.0
        let vector = CGVector(dx : k*(touchLocation.x-cell.position.x),dy : k*(touchLocation.y-cell.position.y))
        let antiVirusMove = SKAction.move(by: vector, duration:1.0)
        let antiVirusMoveDone = SKAction.removeFromParent()
        let sequence = SKAction.sequence([antiVirusMove, antiVirusMoveDone])
        antiVirus.physicsBody?.affectedByGravity = false
        antiVirus.physicsBody = SKPhysicsBody(rectangleOf: antiVirus.frame.size)
        antiVirus.physicsBody?.categoryBitMask = antiVirusCategory
        antiVirus.physicsBody?.contactTestBitMask = virusCategory | antiVirusCategory
        antiVirus.physicsBody?.isDynamic = false
        antiVirus.zPosition = 9
        addChild(antiVirus)
        antiVirus.run(sequence)
    }
    @objc func spawnVirus(){
        //setting  the physics properties
        //adding the node to the scence
        //spawing virus at random postions within the screen size of 260 which is that of the SE
        //makign sure these are colliadeable using the bit masks
        //making the spawn postions random within the 260 x axis and moving towards the y axis of 300
        virus = SKSpriteNode(imageNamed: "virusGreen")
        virus.size = CGSize(width: 30, height: 30)
        virus.zPosition = 4
        virus.physicsBody?.categoryBitMask = virusCategory
        virus.physicsBody?.collisionBitMask = virusCategory
        virus.physicsBody?.contactTestBitMask = 0
        virus.physicsBody?.affectedByGravity = false
        virus.physicsBody = SKPhysicsBody(rectangleOf: virus.frame.size)
        let action = SKAction.moveTo(y: 300, duration: 10)
        virus.position = CGPoint(x: CGFloat(arc4random_uniform(260)), y: self.size.height)
        arrayVirus.append(virus)
        virus.run(SKAction.repeatForever(action))
        self.addChild(virus)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        for virus in arrayVirus{
            //if contact is made with virus on node a or by then
            //remove virus from parent and incriment the score
            if contact.bodyB.node == virus || contact.bodyA.node == virus{
                virus.removeFromParent()
                scoreCount += 1
                print(scoreCount)
                let scoreCountString = String(scoreCount)
                scoreLabel.text = scoreCountString
            } else{
                //if contac with the cell for either node a or b then call game over
                if contact.bodyB.node == cell || contact.bodyA.node == cell{
                    endGame()
                }
            }
        }
    }
    func bloodFlowAnimation(){
        //creating a blood partical and setting as the background by changing the z position
        let bloodFlow = SKEmitterNode(fileNamed: "BloodParticle")
        bloodFlow!.position = CGPoint(x: frame.midX, y: frame.midY)
        bloodFlow?.zPosition = -1
        addChild(bloodFlow!)
    }
    //passing a hex code to regonisde the color of the hex value when it is passed
    //as swift doesnt recognise hex values a mehtod has been created to do so
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

