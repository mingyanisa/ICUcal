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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("type=='"+self.type!+"'"))
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FormulaTableViewCell
        cell.formulaName.text! = formula[indexPath.row].name
        cell.isFav.setTitle(formula[indexPath.row].id, for: .normal)
        
        
        if(formula[indexPath.row].isFavorite == false){
            cell.isFav.imageView?.image = #imageLiteral(resourceName: "ic_star_border")
            print("return non fav")
            
            return cell
            
        }else{
            cell.isFav.imageView?.image = #imageLiteral(resourceName: "ic_star")
            print("return fav")
            
            return cell
            
        }
        
        print (formula[indexPath.row].name)
       
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
    
    @IBAction func isPressFev(_ sender: Any) {
        let realm = try! Realm()
        let formula = Array(realm.objects(Formula.self).filter("type=='"+self.type!+"'"))
        
        if let button = sender as? UIButton{
            
            for i in 0..<self.tableView.numberOfRows(inSection: 0){
                let indexpath = IndexPath(row: i, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexpath) as! FormulaTableViewCell
                if(formula[indexpath.row].id == button.currentTitle){
                    try! realm.write {
                        if(formula[indexpath.row].isFavorite == false){
                            formula[indexpath.row].isFavorite = true
                            self.tableView.reloadData()
                        }else{
                            formula[indexpath.row].isFavorite = false
                            self.tableView.reloadData()
                        }
                    }
                   
                    
                }
            }
            
        }
    }
}
    

class FormulaTableViewCell: UITableViewCell {
    @IBOutlet weak var formulaName: UILabel!
    
    @IBOutlet weak var isFav: UIButton!
}
