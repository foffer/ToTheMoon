//
//  IdeaDetailTableView.swift
//  To The Moon
//
//  Created by Jes Buusmann on 07/07/15.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import Foundation
import UIKit

class IdeaDetailTableView: UITableViewController {
    var idea: Idea?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idea?.questions.count ?? 0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ideaDetailQuestionCell", forIndexPath: indexPath) as! IdeaDetailTableViewCell
        let questions = idea?.questions
        let q = questions![indexPath.row]
        cell.configureCell(q)
        return cell
    }
}