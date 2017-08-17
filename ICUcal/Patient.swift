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
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = patientTableView.dequeueReusableCell(withIdentifier: "patientCell") as! PatientTableViewCell
        cell.label.text = "Hello World"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPatientDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination.childViewControllers[0]
        
    }
}

class PatientTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
}
