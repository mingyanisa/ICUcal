//
//  Profile.swift
//  ICUcal
//
//  Created by admin on 8/17/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var patient: Patient?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var sicknessLabel: UILabel!
    @IBOutlet weak var allergyLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    override func viewDidLoad() {
        if let data = patient {
            nameLabel.text = data.name
            ageLabel.text = String(describing:data.age)
            genderLabel.text = data.sex
            heightLabel.text = String(describing: data.height)
            weightLabel.text = String(describing: data.weight)
            sicknessLabel.text = data.sickness
            allergyLabel.text = data.allergy
            noteLabel.text = data.note
        }
    }
    @IBAction func doneBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier {
            case "editProfile":
                let destination = segue.destination.childViewControllers[0] as! NewPatientViewController
                destination.patient = patient
                destination.previousView = self
                break
            default:
                break
            }
        }
        
        
    }
}
