//
//  FormulaController.swift
//  ICUcal
//
//  Created by Admin on 8/19/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import UIKit
import RealmSwift
class FormulaViewController: UITableViewController{
    var type : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("type=='"+self.type!+"'"))
        print (formula)
        print ("type=='"+self.type!+"'")
    }
    
}
