//
//  myModel.swift
//  quiz
//
//  Created by Matthew Fisher on 13/05/2019.
//  Copyright © 2019 Matt Fisher. All rights reserved.
//

import Foundation
var scoreData = [String]()
class MyModel {
    var students = [Student]()
    
    
    init()
    {
        students.append(Student(name: "Fred",age: "18"))
        students.append(Student(name: "John",age: "21"))
        students.append(Student(name: "Mary",age: "35"))
        students.append(Student(name: "Jane",age: "20"))
        students.append(Student(name: "Jggesefe",age: "gef0"))
    }
    
    open func getStudents()->[Student]
    {
        return students
    }
}

class Student {
    private var name:String
    private var age:String
    
    init(name:String, age:String) {
        self.name=name
        self.age=age
    }
    
    public func getName() -> String {
        return name
    }
    public func getAge() -> String {
        return age
    }
    
    
}
