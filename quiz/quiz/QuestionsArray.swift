////
////  QuestionsArray.swift
////  quiz
////
////  Created by Matthew Fisher on 12/05/2019.
////  Copyright © 2019 Matt Fisher. All rights reserved.
////
//
//import Foundation
//
//
////
////  ViewController.swift
////  quiz
////
////  Created by Matthew Fisher on 11/05/2019.
////  Copyright © 2019 Matt Fisher. All rights reserved.
////
//
//import UIKit
//class ViewController: UIViewController {
//
//    @IBOutlet weak var Question: UILabel!
//
//    @IBOutlet weak var pAnswer1: UIButton!
//    @IBOutlet weak var pAnswer3: UIButton!
//    @IBOutlet weak var pAnswer2: UIButton!
//    @IBOutlet weak var pAnswer4: UIButton!
//
//    var numberOfQuestions = 0
//    var answer1 = 0
//    var answer2 = 1
//    var answer3 = 2
//    var answer4 = 3
//    var correctAnswer = String()
//    var panswer1 = String()
//    var panswer2 = String()
//    var panswer3 = String()
//    var panswer4 = String()
//    var qList = [String]()
//    var pList = [String]()
//    var aList = [String]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        readTextFromFile()
//        readTextFromFilePAnswers()
//        readTextFromFileAnswers()
//        selectQuestions()
//    }
//
//    func selectQuestions(){
//        if qList.count > 0{
//            //Question.text = questions[numberOfQuestions].question
//            Question.text = qList[numberOfQuestions]
//            correctAnswer = aList[numberOfQuestions]
//
//            NSLog(correctAnswer)
//
//            pAnswer1.setTitle(pList[0], for: UIControl.State.normal)
//            pAnswer2.setTitle(pList[1], for: UIControl.State.normal)
//            pAnswer3.setTitle(pList[2], for: UIControl.State.normal)
//            pAnswer4.setTitle(pList[3], for: UIControl.State.normal)
//
//            panswer1 = aList[answer1]
//            panswer2 = aList[answer2]
//            panswer3 = aList[answer3]
//            panswer4 = aList[answer4]
//            print(pList)
//        } else{
//            NSLog("Done")
//        }
//    }
//
//    func incrementAnswers() {
//        answer1+=1
//        answer2+=1
//        answer3+=1
//        answer4+=1
//    }
//
//    @IBAction func pAnswer1(_ sender: Any) {
//        if correctAnswer == panswer1
//        {
//            numberOfQuestions += 1
//            incrementAnswers()
//            //    delete()
//            selectQuestions()
//        }
//        else
//        {
//            NSLog("fail")
//        }
//    }
//
//    @IBAction func pAnswer2(_ sender: Any) {
//        if correctAnswer == panswer2
//        {
//            numberOfQuestions += 1
//            incrementAnswers()
//            //     delete()
//            selectQuestions()
//        }
//        else
//        {
//            NSLog("fail")
//        }
//    }
//
//    @IBAction func pAnswer3(_ sender: Any) {
//        if correctAnswer == panswer3
//        {
//            numberOfQuestions += 1
//            incrementAnswers()
//            //   delete()
//            selectQuestions()
//        }
//        else
//        {
//            NSLog("fail")
//        }
//    }
//    @IBAction func pAnswer4(_ sender: Any) {
//        if correctAnswer == panswer4
//        {
//            numberOfQuestions += 1
//            incrementAnswers()
//            // delete()
//            selectQuestions()
//        }
//        else
//        {
//            NSLog("fail")
//        }
//    }
//
//    func readTextFromFile(){
//        if let path = Bundle.main.path(forResource: "questions", ofType: "txt") {
//            do {
//                let file = try String(contentsOfFile: path)
//                qList = file.components(separatedBy: "\n")
//                print(qList)
//            } catch {
//                print(error)
//            }
//        }
//
//    }
//
//    func readTextFromFilePAnswers(){
//        if let path = Bundle.main.path(forResource: "potentialAnswers", ofType: "txt") {
//            do {
//                let file = try String(contentsOfFile: path)
//                pList = file.components(separatedBy: "\n")
//                print(pList)
//            } catch {
//                print(error)
//            }
//        }
//
//    }
//
//    func readTextFromFileAnswers(){
//        if let path = Bundle.main.path(forResource: "Answers", ofType: "txt") {
//            do {
//                let file = try String(contentsOfFile: path)
//                aList = file.components(separatedBy: "\n")
//                print(aList)
//            } catch {
//                print(error)
//            }
//        }
//
//    }
//
//    func delete()
//    {
//        if !pList.isEmpty && pList.count >= 4 {
//            pList.remove(at: 0)
//            pList.remove(at: 0)
//            pList.remove(at: 0)
//            pList.remove(at: 0)
//        }
//
//    }
//}
//
//
