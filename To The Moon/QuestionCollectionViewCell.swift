//
//  QuestionCollectionViewCell.swift
//  To The Moon
//
//  Created by Christoffer Buusmann on 03/07/2015.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import Foundation
import UIKit

protocol QuestionInterface {
    func nextDidPress(sender:AnyObject)
    func dismissDidPress(sender:AnyObject?)
}

class QuestionCollectionViewCell: UICollectionViewCell, QuestionInterface {
    
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var questionDescriptionLabel: UILabel!
    @IBOutlet var quoteLabel    : UILabel!
    @IBOutlet var authorLabel   : UILabel!
    @IBOutlet var scoreLabel    : UILabel!
    @IBOutlet var scoreSlider   : UISlider!
    @IBOutlet var nextButton    : UIButton!
    
    var delegate: QuestionInterface?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.whiteColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureCell(question:[String:String]) {
        if let  questionText = question["title"],
            questionDescription = question["question"],
                quoteText = question["quote"],
                authorText = question["author"] {
                    questionLabel.text = questionText ?? ""
                    questionDescriptionLabel.text = questionDescription ?? ""
                    quoteLabel.text = quoteText ?? ""
                    authorLabel.text = authorText ?? ""
        }
    }
    @IBAction func sliderDidSlide(sender: AnyObject) {
        if let slider = sender as? UISlider {
            scoreLabel.text = "\(Int(slider.value))"
        }
    }
    @IBAction func nextDidPress(sender: AnyObject) {
//        let score = [
//            "question" : "\(questionLabel.text!)",
//            "score" : scoreSlider.value
//        ]
        let q = Question()
        q.question = questionLabel.text!
        q.score = Int(scoreSlider.value)

        delegate?.nextDidPress(q)

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        scoreSlider.value = 5.0
        scoreLabel.text = "5"
    }
    @IBAction func dismissDidPress(sender: AnyObject?) {
        delegate?.dismissDidPress(nil)
    }
}