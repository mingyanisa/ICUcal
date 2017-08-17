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

class Formular: Object {
    let variable = List<RealmString>()
    dynamic var formula = ""
}
