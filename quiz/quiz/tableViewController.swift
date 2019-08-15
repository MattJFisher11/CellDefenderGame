//
//  tableViewController.swift
//  quiz
//
//  Created by Matthew Fisher on 13/05/2019.
//  Copyright © 2019 Matt Fisher. All rights reserved.
//

import Foundation

import UIKit

class tableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    let cellIdentifier = "myCell"
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.myModel.getStudents().count
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath as IndexPath)
        
        let students = appDelegate.myModel.getStudents()
        cell.textLabel?.text = students[indexPath.row].getName()
        
        return cell
        
    }
    
}

