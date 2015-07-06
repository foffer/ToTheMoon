//
//  IdeaDetailTableViewCell.swift
//  To The Moon
//
//  Created by Jes Buusmann on 07/07/15.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import Foundation
import UIKit

class IdeaDetailTableViewCell: UITableViewCell {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    func configureCell(question:Question) {
        questionLabel.text = question.question ?? ""
        scoreLabel.text = "\(question.score)" ?? ""
    }
}