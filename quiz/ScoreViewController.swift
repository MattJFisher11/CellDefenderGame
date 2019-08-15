//
//  ScoreViewController.swift
//  quiz
//
//  Created by Matthew Fisher on 13/05/2019.
//  Copyright © 2019 Matt Fisher. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            var students = [Student]()
            
            init()
            {
                students.append(Student(name: "Fred",age: 18))
                students.append(Student(name: "John",age: 21))
                students.append(Student(name: "Mary",age: 35))
                students.append(Student(name: "Jane",age: 20))
            }
            
        public func getStudents()->[Student]
            {
                return students
            }
        }
        
        class Student {
            private var name:String
            private var age:Int
            
            init(name:String, age:Int) {
                self.name=name
                self.age=age
            }
            
            public func getName() -> String {
                return name
            }

        // Do any additional setup after loading the view.
    }

}
