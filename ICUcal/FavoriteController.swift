//
//  FavoriteController.swift
//  ICUcal
//
//  Created by Admin on 8/21/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import UIKit
import RealmSwift
class FavoriteController: UITableViewController{
    var type : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("isFavorite==true"))
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoriteTableViewCell
        cell.formulaName.text! = formula[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("isFavorite==true"))
        
        print(formula.count)
        return formula.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("isFavorite==true"))
        
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
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let del = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            let realm = try! Realm()
            let formula = Array(realm.objects(Formula.self).filter("isFavorite==true"))
            try! realm.write {
                formula[indexPath.row].isFavorite = false
                self.tableView.reloadData()
            }
        }
        del.backgroundColor = UIColor.red
        return[del]
    }
    
}
class FavoriteTableViewCell: UITableViewCell{
    @IBOutlet weak var formulaName: UILabel!
}
