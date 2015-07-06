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
    let questions = List<Question>()

}