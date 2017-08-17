//
//  Profile.swift
//  ICUcal
//
//  Created by admin on 8/17/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBAction func doneBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier {
            case "editProfile":
                let destination = segue.destination as! NewPatientViewController
                destination.isEditingProfile = true
                break
            default:
                break
            }
        }
    }
}
