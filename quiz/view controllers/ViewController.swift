//
//  ViewController.swift
//  quiz
//
//  Created by Matthew Fisher on 11/05/2019.
//  Copyright © 2019 Matt Fisher. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var Question: UILabel!
    var correctAnswer = String()
    //create a array qlist
    var qList = [String]()
    //create a array plist
    var pList = [String]()
    //create a array Alist
    var aList = [String]()
    //create a string
    var panswer1 = String()
    //create a string
    var panswer2 = String()
    //create a string
    var panswer3 = String()
    //create a string
    var panswer4 = String()
    //quiz score given the value of zero
    var quizScore = 0
    //create button from story board
    @IBOutlet weak var pAnswer1: UIButton!
    //create button from story board
    @IBOutlet weak var pAnswer2: UIButton!
    //create button from story board
    @IBOutlet weak var pAnswer3: UIButton!
    //create button from story board
    @IBOutlet weak var pAnswer4: UIButton!
    //create a sklabel
    @IBOutlet weak var questionScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //call the method
        readTextFromFile()
        //call the method
        readTextFromFilePAnswers()
        //call the method
        readTextFromFileAnswers()
        //call the method
        selectQuestions()
        //call the method
        buttonStyle()
    }
    
    func buttonStyle(){
        //seting the style of the buttons
        //curving the corners and setting the colour to orange
        self.pAnswer1.layer.cornerRadius = 25
        self.pAnswer2.layer.cornerRadius = 25
        self.pAnswer3.layer.cornerRadius = 25
        self.pAnswer4.layer.cornerRadius = 25
        self.pAnswer1.backgroundColor = UIColor.orange
        self.pAnswer2.backgroundColor = UIColor.orange
        self.pAnswer3.backgroundColor = UIColor.orange
        self.pAnswer4.backgroundColor = UIColor.orange
    }

    func selectQuestions(){
        //if the array of questiions is empty and the potential in the array
        //answers is greater than or equal to 4 in the array
        if !qList.isEmpty  && pList.count >= 4 {
            Question.text = qList[0]
            correctAnswer = aList[0]
            panswer1 = pList[0]
            panswer2 = pList[1]
            panswer3 = pList[2]
            panswer4 = pList[3]
            pAnswer1.setTitle(panswer1, for: UIControl.State.normal)
            pAnswer2.setTitle(panswer2, for: UIControl.State.normal)
            pAnswer3.setTitle(panswer3, for: UIControl.State.normal)
            pAnswer4.setTitle(panswer4, for: UIControl.State.normal)
        } else{
            NSLog("Done")
            writeScore(data: "\(quizScore)")
            //call game over method
            showAlertGameOver()
        }
    }
    
    
    
    func showAlertGameOver() {
        //
        let gameOver = UIAlertController(title: "Game Over!", message:"Your Score was \(quizScore)", preferredStyle: .alert)
        let goHome = UIAlertAction(title: "Bonus Game!", style: .default) { (_) -> Void in
            self.performSegue(withIdentifier: "1111", sender: self)
        }
        gameOver.addAction(goHome)
        present(gameOver, animated: true, completion: nil)
    }
    
    ///reads files for the potential answers, questions and correct answers, reads each line and put them into three seperte arrays
    func readTextFromFile(){
        if let path = Bundle.main.path(forResource: "questions", ofType: "txt") {
            do {
                let file = try String(contentsOfFile: path)
                qList = file.components(separatedBy: "\n")
                print(qList)
            } catch {
                print(error)
            }
        }
    }
    
    func readTextFromFilePAnswers(){
        if let path = Bundle.main.path(forResource: "potentialAnswers", ofType: "txt") {
            do {
                let file = try String(contentsOfFile: path)
                pList = file.components(separatedBy: "\n")
                print(pList)
            } catch {
                print(error)
            }
        }
    }
    func readTextFromFileAnswers(){
        if let path = Bundle.main.path(forResource: "Answers", ofType: "txt") {
            do {
                let file = try String(contentsOfFile: path)
                aList = file.components(separatedBy: "\n")
                print(aList)
            } catch {
                print(error)
            }
        }
    }
    //if answers are correct, delete the previous 4 pAnswers in the array, 1 st question and 1 correct answer
    @IBAction func pAnswer1Click(_ sender: Any) {
        if correctAnswer == panswer1{
            //call delete method
            delete()
            //call updtae score method
            updateScore()
            //call select questions method
            selectQuestions()
        } else {
            NSLog("fail")
            //call wrong score
            updateScoreWrong()
        }
    }
    
    @IBAction func pAnswe2Click(_ sender: Any) {
        if correctAnswer == panswer2{
            //call delete method
            delete()
            //call updtae score method
            updateScore()
            //call select questions method
            selectQuestions()
        } else {
            NSLog("fail")
            //call wrong score
            updateScoreWrong()
        }
    }
    
    @IBAction func pAnswer3Click(_ sender: Any) {
        if correctAnswer == panswer3{
            //call delete method
            delete()
            //call updtae score method
            updateScore()
            //call select questions method
            selectQuestions()
        } else {
            NSLog("fail")
            //call wrong score
            updateScoreWrong()
        }
    }
    @IBAction func pAnswer4Click(_ sender: Any) {
        if correctAnswer == panswer4{
            //call delete method
            delete()
            //call updtae score method
            updateScore()
            //call select questions method
            selectQuestions()
        } else {
            NSLog("fail")
            //call wrong score
            updateScoreWrong()
        }
    }
        func delete(){
            //if plist is not empty and pl size of array is greater than 4 remove
            //current values at the postions of each array
            if !pList.isEmpty && pList.count > 4 {
                pList.remove(at: 0)
                pList.remove(at: 0)
                pList.remove(at: 0)
                pList.remove(at: 0)
                qList.remove(at: 0)
                aList.remove(at: 0)
            }
        }
    func updateScore()
    {
        //incriment score by one
        quizScore = quizScore + 1
        questionScoreLabel.text = "Score: " + "\(quizScore)"
    }
    
    func updateScoreWrong()
    {
        //decrease the score by one
        quizScore = quizScore - 1
        questionScoreLabel.text = "Score: " + "\(quizScore)"
    }
    
    //wiriting the score to a file highscoressave
    //settign thepath of the file
    //append the file by delimnitng a new line ans then appending that data
    func writeScore(data:String){
        let fileName = "highScoresSave"
        let docDirUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl = docDirUrl.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("file Path: \(fileUrl.path)")
        do {
           // try outStr.write(to: fileUrl, atomically: true, encoding: String.Encoding.utf8)
            try data.appendLineToURL(fileURL: fileUrl)
        } catch let error as NSError {
            print("failed to write to URL")
            print(error)
        }
    }
}

extension String {
    func appendLineToURL(fileURL: URL) throws {
        try (self + "\n").appendToURL(fileURL: fileURL)
    }
    func appendToURL(fileURL: URL) throws {
        let data = self.data(using: String.Encoding.utf8)!
        try data.append(fileURL: fileURL)
    }
}
extension Data {
    func append(fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        }
        else {
            try write(to: fileURL, options: .atomic)
        }
    }

}
