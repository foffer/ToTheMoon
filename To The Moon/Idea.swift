//
//  Idea.swift
//  To The Moon
//
//  Created by Jes Buusmann on 06/07/15.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import Foundation
import RealmSwift

class Idea: Object {
    dynamic var createdAt = NSDate(timeIntervalSince1970: 1)
    dynamic var name = ""
    dynamic var uuid = ""
    dynamic var overallScore = 0
    let questions = List<Question>()
    
    override static func primaryKey() -> String {
        return "uuid"
    }
}