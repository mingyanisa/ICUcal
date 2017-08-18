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
    
    var allPatient: [Patient]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        allPatient = Array(realm.objects(Patient.self))
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (allPatient?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = patientTableView.dequeueReusableCell(withIdentifier: "patientCell") as! PatientTableViewCell
        cell.label.text = allPatient?[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPatientDetail", sender: allPatient?[indexPath.row])
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
}

class PatientTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
}
