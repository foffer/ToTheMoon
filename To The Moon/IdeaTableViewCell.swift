//
//  IdeaTableViewCell.swift
//  To The Moon
//
//  Created by Jes Buusmann on 06/07/15.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import Foundation
import UIKit

class IdeaTableViewCell: UITableViewCell {
    
    
    @IBOutlet var ideaLabel:UILabel!
    @IBOutlet var createdAtLabel:UILabel!
    @IBOutlet var scoreLabel:UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureCell(idea:Idea) {
        ideaLabel.text = idea.name
        scoreLabel.text = "\(idea.overallScore)"
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        let dateString = dateFormatter.stringFromDate(idea.createdAt)
        createdAtLabel.text = dateString
        
    }
}