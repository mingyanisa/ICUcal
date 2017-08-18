//
//  AppInit.swift
//  ICUcal
//
//  Created by admin on 8/18/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        if let array = data as? [Any]{
        //            for object in array{
        //
        //            }
        //        }
        
        if isAppHasBeenLaunched() {
            print("Hello World")
            let realm = try! Realm()
            
            
            
            try! realm.write {
                
            }
        }
        
    }
    
    func isAppHasBeenLaunched() -> Bool{
        let defualts = UserDefaults.standard
        
        if defualts.string(forKey: "isAppHasBeenLaunched") != nil {
            return false
        }else{
            defualts.set(true, forKey: "isAppHasBeenLaunched")
            return true
        }
    }
}
