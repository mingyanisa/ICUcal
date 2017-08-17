//
//  NewPatient.swift
//  ICUcal
//
//  Created by admin on 8/17/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import UIKit
import RealmSwift

class NewPatientViewController: UIViewController {
    
    var isEditingProfile = false
    
    
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func DoneBtnPressed(_ sender: UIBarButtonItem) {
        if isEditingProfile {
            //
        }else{
            //
        }
        self.dismiss(animated: true, completion: nil)
    }
}
