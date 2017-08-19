//
//  Patient.swift
//  ICUcal
//
//  Created by admin on 8/17/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import UIKit
import RealmSwift

class PatientTableViewController: UITableViewController {
    @IBOutlet var patientTableView: UITableView!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        let allPatient = Array(realm.objects(Patient.self))
        return (allPatient.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = patientTableView.dequeueReusableCell(withIdentifier: "patientCell") as! PatientTableViewCell
        let realm = try! Realm()
        let allPatient = Array(realm.objects(Patient.self))
        cell.label.text = allPatient[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        let allPatient = Array(realm.objects(Patient.self))
        performSegue(withIdentifier: "showPatientDetail", sender: allPatient[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier {
            case "showPatientDetail":
                let destination = segue.destination.childViewControllers[0] as! ProfileViewController
                destination.patient = sender as? Patient
                break
            default:
                break
            }
        }
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let del = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            let realm = try! Realm()
            let allPatient = Array(realm.objects(Patient.self))
            //bug is here
            try! realm.write {
                realm.delete(allPatient[indexPath.row])
                self.tableView.reloadData()
            }
            
        }
        del.backgroundColor = UIColor.red
        return[del]
    }
    
}

class PatientTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
}
