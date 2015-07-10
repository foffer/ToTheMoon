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
        tableView.backgroundColor = DarkBlueColor
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idea?.questions.count ?? 0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ideaDetailQuestionCell", forIndexPath: indexPath) as! IdeaDetailTableViewCell
        cell.backgroundColor = BlueColor
        let questions = idea?.questions
        let q = questions![indexPath.row]
        cell.configureCell(q)
        return cell
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCellWithIdentifier("ideaDetailHeader") as! IdeaDetailHeaderView
        
        header.backgroundColor = BlueColor
//        header.scoreLabel.text = "\(idea!.overallScore)"
        var verdictString: String?
        switch idea!.overallScore {
        case 0..<50:
            verdictString = "Your idea scored 50 or below. There are better things you should be doing. Move along skip!"
        case 50..<75:
            verdictString = "Your idea has potential in the area between 50 to 75 points, but you might find it difficult to get funding."
        case 75...100:
            verdictString = "You got 75 points or more. Full steam ahead captain!"
        default:
            verdictString = "Could not get verdict"
        }
        header.headerLabel.text = verdictString
        
        return header
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
}