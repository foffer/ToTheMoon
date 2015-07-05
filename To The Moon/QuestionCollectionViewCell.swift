//
//  QuestionCollectionViewCell.swift
//  To The Moon
//
//  Created by Christoffer Buusmann on 03/07/2015.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import Foundation
import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var quoteLabel    : UILabel!
    @IBOutlet var authorLabel   : UILabel!
    @IBOutlet var scoreLabel    : UILabel!
    @IBOutlet var scoreSlider   : UISlider!
    @IBOutlet var nextButton    : UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        
    }
    
    func configureCell(question:AnyObject) {
        if let questionText, quoteText, authorText = question["title"], question["quote"], question["author"] as String {
            
        }
    }
}