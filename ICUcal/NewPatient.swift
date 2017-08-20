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
    
    var patient: Patient?
    var tableView: PatientTableViewController?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexSwitch: UISwitch!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var sicknessTextField: UITextField!
    @IBOutlet weak var allerygyTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let formerData = patient {
            nameTextField.text = formerData.name
            ageTextField.text = String(describing: formerData.age)
            sexSwitch.isOn = (formerData.sex == "Male")
            heightTextField.text = String(describing: formerData.height)
            weightTextField.text = String(describing: formerData.weight)
            sicknessTextField.text = formerData.sickness
            allerygyTextField.text = formerData.allergy
            noteTextField.text = formerData.note
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func DoneBtnPressed(_ sender: UIBarButtonItem) {
        if patient == nil {
            let newPatient = Patient()
            newPatient.id = UUID().uuidString
            newPatient.name = nameTextField.text!
            newPatient.age = Int(ageTextField.text!)!
            newPatient.sex = sexSwitch.isOn ? "Male" : "Female"
            newPatient.height = Double(heightTextField.text!)!
            newPatient.weight = Double(weightTextField.text!)!
            newPatient.sickness = sicknessTextField.text!
            newPatient.allergy = allerygyTextField.text!
            newPatient.note = noteTextField.text!
            
            let realm = try! Realm()
            
            try! realm.write {
                realm.add(newPatient)
            }
        }else{
            let realm = try! Realm()
            
            try! realm.write {
                patient?.name = nameTextField.text!
                patient?.age = Int(ageTextField.text!)!
                patient?.sex = sexSwitch.isOn ? "Male" : "Female"
                patient?.height = Double(heightTextField.text!)!
                patient?.weight = Double(weightTextField.text!)!
                patient?.sickness = sicknessTextField.text!
                patient?.allergy = allerygyTextField.text!
                patient?.note = noteTextField.text!
            }
        }
        self.dismiss(animated: true, completion: nil)
        if let destination = tableView?.tableView{
            destination.reloadData()
        }
    }
}
