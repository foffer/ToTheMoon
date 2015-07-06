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
//    dynamic var id = 0
    dynamic var createdAt = NSDate()
    let questions = List<Question>()
    
//    override static func primaryKey() -> String? {
//        return "id"
//    }
}