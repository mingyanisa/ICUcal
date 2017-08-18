//
//  Data.swift
//  ICUcal
//
//  Created by admin on 8/17/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import Foundation
import RealmSwift

class RealmString: Object {
    dynamic var text = ""
}

class Formula: Object {
    dynamic var id = ""
    dynamic var name = ""
    let variable = List<RealmString>()
    dynamic var type = ""
    dynamic var formula = ""
    dynamic var isFavorite = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Patient: Object {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var age = 0
    dynamic var sex = ""
    dynamic var height:Double = 0.0
    dynamic var weight:Double = 0.0
    dynamic var sickness = ""
    dynamic var allergy = ""
    dynamic var note = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
