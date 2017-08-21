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
    var previousView: UIViewController?
    
    @IBOutlet weak var nameTextField: UITextField?
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
            nameTextField?.text = formerData.name
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
            guard let text = nameTextField?.text, !text.isEmpty else {
                
                let alert = UIAlertController(title: "Alert", message: "กรุณากรอกข้อมูลให้ครบ", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("found nil")
                return
            }
            newPatient.name = (nameTextField?.text!)!
            
            newPatient.sex = sexSwitch.isOn ? "Male" : "Female"
            
            if(ageTextField.text?.isEmpty)!{newPatient.age = 0}else{newPatient.age = Int(ageTextField.text!)! }
            
            if(heightTextField.text?.isEmpty)!{newPatient.height = 0}else{newPatient.height = Double(heightTextField.text!)!}
            if(weightTextField.text?.isEmpty)!{newPatient.weight = 0}else{newPatient.weight = Double(weightTextField.text!)!}
            
            if(sicknessTextField.text?.isEmpty)!{newPatient.sickness = "-"}else{newPatient.sickness = sicknessTextField.text!}
            if(allerygyTextField.text?.isEmpty)!{newPatient.allergy = "-"}else{newPatient.allergy = allerygyTextField.text!}
            if(noteTextField.text?.isEmpty)!{newPatient.note = "-"}else{newPatient.note = noteTextField.text!}
            
            let realm = try! Realm()
            
            try! realm.write {
                realm.add(newPatient)
            }
        }else{
            let realm = try! Realm()
            
            try! realm.write {
                
                patient?.name = (nameTextField?.text!)!
                if(ageTextField.text?.isEmpty)!{patient?.age = 0}else{patient?.age = Int(ageTextField.text!)! }
                
                if(heightTextField.text?.isEmpty)!{patient?.height = 0}else{patient?.height = Double(heightTextField.text!)!}
                if(weightTextField.text?.isEmpty)!{patient?.weight = 0}else{patient?.weight = Double(weightTextField.text!)!}
                
                if(sicknessTextField.text?.isEmpty)!{patient?.sickness = "-"}else{patient?.sickness = sicknessTextField.text!}
                if(allerygyTextField.text?.isEmpty)!{patient?.allergy = "-"}else{patient?.allergy = allerygyTextField.text!}
                if(noteTextField.text?.isEmpty)!{patient?.note = "-"}else{patient?.note = noteTextField.text!}
//                patient?.age = Int(ageTextField.text!)!
                patient?.sex = sexSwitch.isOn ? "Male" : "Female"
//                patient?.height = Double(heightTextField.text!)!
//                patient?.weight = Double(weightTextField.text!)!
//                patient?.sickness = sicknessTextField.text!
//                patient?.allergy = allerygyTextField.text!
//                patient?.note = noteTextField.text!
            }
        }
        self.dismiss(animated: true, completion: nil)
        if let view = previousView{
            view.viewDidLoad()
        }
        if let destination = tableView?.tableView{
            destination.reloadData()
        }
    }
}
