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
    
    var newContentView: UIView?
    
    @IBOutlet var ideaLabel:UILabel!
    @IBOutlet var createdAtLabel:UILabel!
    @IBOutlet var scoreLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        configureViews()
    }
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
    func configureViews() {
        let inset:CGFloat = 5.0
        let frame = CGRectMake(inset, inset, CGRectGetWidth(contentView.bounds) - 60, CGRectGetHeight(contentView.frame) - 10)
        
        print(frame)
        newContentView = UIView(frame: frame)
        print(newContentView?.frame)
        newContentView?.layer.borderWidth = 0.5
        newContentView?.layer.borderColor = UIColor.whiteColor().CGColor
//        contentView.addSubview(newContentView!)
    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
}