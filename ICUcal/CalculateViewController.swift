//
//  CalculateViewController.swift
//  ICUcal
//
//  Created by Admin on 8/20/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import UIKit
import RealmSwift
class CalculateViewController: UITableViewController{
    @IBOutlet weak var calculateButton: UIButton!
    
    var formula : Formula!
    var result: Double?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == formula.variable.count){
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! ResultTableViewCell
            if let cal = result{
                cell.result.text! = String(cal)
            }
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CalculateTableViewCell
        self.title = formula.name
        cell.parameterName.text! = formula.variable[indexPath.row].name
        cell.unit.text! = formula.variable[indexPath.row].unit
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return formula.variable.count+1

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == formula.variable.count && result == nil){
            return 0
        }
        return 100
    }
    
    @IBAction func isPress(_ sender: Any) {
        var parameter = [String : Double]()
        
        print(self.tableView.numberOfRows(inSection: 0))
        
        for i in 0..<self.tableView.numberOfRows(inSection: 0) - 1{
            let indexpath = IndexPath(row: i, section: 0)
            let cell = self.tableView.cellForRow(at: indexpath) as! CalculateTableViewCell
            print(cell)
            guard let text = cell.textField?.text, !text.isEmpty else {
                let alert = UIAlertController(title: "Alert", message: "กรุณากรอกข้อมูลให้ครบ", preferredStyle: UIAlertControllerStyle.alert)
                                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                print("found nil")
                return
            }
        }
        
        for i in 0..<self.tableView.numberOfRows(inSection: 0)-1{

            let indexpath = IndexPath(row: i, section: 0)

            let cell = self.tableView.cellForRow(at: indexpath) as! CalculateTableViewCell

            parameter.updateValue(Double((cell.textField?.text!)!)!, forKey: String(Character(UnicodeScalar(i + 97)!)))
            
            
        }
        
        if let calculate = formula.formula.expression.expressionValue(with: parameter, context: nil) as? Double {
              result = calculate
        
        }
        self.tableView.reloadData()
       
    }
}
extension String {
    var expression: NSExpression {
        return NSExpression(format: self)
    }
}

class CalculateTableViewCell: UITableViewCell{

    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var parameterName: UILabel!
    @IBOutlet weak var unit: UILabel!
}
class ResultTableViewCell: UITableViewCell{
    @IBOutlet weak var result: UILabel!
}




