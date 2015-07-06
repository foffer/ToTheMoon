//
//  Question.swift
//  To The Moon
//
//  Created by Jes Buusmann on 06/07/15.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object {
    dynamic var question = ""
    dynamic var score = 0
    dynamic var owner: Idea?
}