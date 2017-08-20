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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("type=='"+self.type!+"'"))
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FormulaTableViewCell
        cell.formulaName.text! = formula[indexPath.row].name
        
        print (formula[indexPath.row].name)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("type=='"+self.type!+"'"))
        return formula.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("type=='"+self.type!+"'"))
        
        performSegue(withIdentifier: "calculateFormula", sender:  formula[indexPath.row])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier {
            case "calculateFormula":
                let destination = segue.destination as! CalculateViewController
                destination.formula = sender as? Formula
                break
            default:
                break
            }
        }
    }
    
}
class FormulaTableViewCell: UITableViewCell {
    @IBOutlet weak var formulaName: UILabel!
    
}
