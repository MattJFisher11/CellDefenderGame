//
//  ScoreTableViewController.swift
//  quiz
//
//  Created by Matthew Fisher on 13/05/2019.
//  Copyright © 2019 Matt Fisher. All rights reserved.
//

import UIKit

class ScoreTableViewController: UITableViewController{
    let cellIdentifier = "myCell"
    var lists = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileName = "highScoresSave"
        let docDirUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl = docDirUrl.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("file Path: \(fileUrl.path)")
        do {
            var inStr = ""
            inStr = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
            lists = inStr.components(separatedBy: .newlines)
            print(lists)
        } catch let error as NSError {
            print("failed to read file")
            print(error)
        }
        print(lists)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return appDelegate.myModel.getStudents().count
        return lists.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //set the label of the cell to each list item which is read in form the text file
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
        cell.textLabel?.text = "HighScoreQuiz : " + lists[indexPath.item]
        return cell
    }
}

