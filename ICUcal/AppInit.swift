//
//  AppInit.swift
//  ICUcal
//
//  Created by admin on 8/18/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import SwiftyJSON

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isAppHasBeenLaunched() {
            var formulaList: [Formula] = []
            
            let jsonString = "{\"allFormula\":[{\"name\":\"BMI\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Height\",\"unit\":\"cm.\"}],\"type\":\"General\",\"formula\":\"a/(b*b*0.0001)\"},{\"name\":\"BSA\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Height\",\"unit\":\"cm.\"}],\"type\":\"General\",\"formula\":\"(a*b*0.01/3600)**(0.5)\"},{\"name\":\"Male predicted IBW\",\"variable\":[{\"name\":\"Height\",\"unit\":\"cm.\"}],\"type\":\"General\",\"formula\":\"a*0.01-100-(a*0.01-150)/4\"},{\"name\":\"Female predicted IBW\",\"variable\":[{\"name\":\"Height\",\"unit\":\"cm.\"}],\"type\":\"General\",\"formula\":\"a*0.01-100-(a*0.01-150)/2\"},{\"name\":\"PPV(%)\",\"variable\":[{\"name\":\"PPmax\",\"unit\":\"mmHg\"},{\"name\":\"PPmin\",\"unit\":\"mmHg\"},{\"name\":\"PPmean\",\"unit\":\"mmHg\"}],\"type\":\"Hemodynamic\",\"formula\":\"((a-b)/c)*100\"},{\"name\":\"Distensibility Index\",\"variable\":[{\"name\":\"IV CDmax\",\"unit\":\"mm\"},{\"name\":\"IV CDmin\",\"unit\":\"mm\"}],\"type\":\"Hemodynamic\",\"formula\":\"(a-b)/b\"},{\"name\":\"Collapsibility Index\",\"variable\":[{\"name\":\"IV CDmax\",\"unit\":\"mm\"},{\"name\":\"IV CDmin\",\"unit\":\"mm\"}],\"type\":\"Hemodynamic\",\"formula\":\"(a-b)/a\"},{\"name\":\"SVR\",\"variable\":[{\"name\":\"M AP\",\"unit\":\"mmHg\"},{\"name\":\"CV P\",\"unit\":\"mmHg\"},{\"name\":\"CO\",\"unit\":\"L/min\"}],\"type\":\"Hemodynamic\",\"formula\":\"(a-b*79.9)/c\"},{\"name\":\"PVR\",\"variable\":[{\"name\":\"MP AP\",\"unit\":\"mmHg\"},{\"name\":\"PCW P\",\"unit\":\"mmHg\"},{\"name\":\"CO\",\"unit\":\"L/min\"}],\"type\":\"Hemodynamic\",\"formula\":\"(a-b*79.9)/c\"},{\"name\":\"CO\",\"variable\":[{\"name\":\"V O2\",\"unit\":\"mL/min\"},{\"name\":\"Hb\",\"unit\":\"g/dL\"},{\"name\":\"SaO2\",\"unit\":\"%\"},{\"name\":\"SvO2\",\"unit\":\"%\"}],\"type\":\"Hemodynamic\",\"formula\":\"a/13.4*b*(c-d)\"},{\"name\":\"CI\",\"variable\":[{\"name\":\"CO\",\"unit\":\"L/min\"},{\"name\":\"BSA\",\"unit\":\"m2\"}],\"type\":\"Hemodynamic\",\"formula\":\"a/b\"},{\"name\":\"QTc(sec)\",\"variable\":[{\"name\":\"QT\",\"unit\":\"sec\"},{\"name\":\"RR\",\"unit\":\"sec\"}],\"type\":\"EKG\",\"formula\":\"a/(b**0.5)\"},{\"name\":\"Male BEE (kCal)\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Height\",\"unit\":\"cm.\"},{\"name\":\"Age\",\"unit\":\"year\"}],\"type\":\"Nutrition\",\"formula\":\"66.473+13.752*a+5.003*b*0.01-6.755*c\"},{\"name\":\"Female BEE (kCal)\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Height\",\"unit\":\"cm.\"},{\"name\":\"Age\",\"unit\":\"year\"}],\"type\":\"Nutrition\",\"formula\":\"655.096+9.563*a+1.85*b*0.01-4.676*c\"},{\"name\":\"Male BMR (kCal)\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Height\",\"unit\":\"cm.\"},{\"name\":\"Age\",\"unit\":\"year\"}],\"type\":\"Nutrition\",\"formula\":\"10*a+6.25*b*0.01-5*c+5\"},{\"name\":\"Female BMR (kCal)\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Height\",\"unit\":\"cm.\"},{\"name\":\"Age\",\"unit\":\"year\"}],\"type\":\"Nutrition\",\"formula\":\"10*a+6.25*b*0.01-5*c-161\"},{\"name\":\"Total Energy Expenditure (kCal/day)\",\"variable\":[{\"name\":\"BEE\",\"unit\":\"kCal\"},{\"name\":\"AF\",\"unit\":\"\"},{\"name\":\"IF\",\"unit\":\"\"}],\"type\":\"Nutrition\",\"formula\":\"a*b*c\"},{\"name\":\"Anion gap\",\"variable\":[{\"name\":\"Na\",\"unit\":\"mmol/L\"},{\"name\":\"Cl\",\"unit\":\"mmol/L\"},{\"name\":\"HCO3\",\"unit\":\"mmol/L\"}],\"type\":\"Nephro\",\"formula\":\"a-b+c\"},{\"name\":\"Corrected Anion gap\",\"variable\":[{\"name\":\"Anion gap\",\"unit\":\"mmol/L\"},{\"name\":\"alb\",\"unit\":\"g/L\"}],\"type\":\"Nephro\",\"formula\":\"a+0.25*(40-b)\"},{\"name\":\"Water Deficit\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Current Na\",\"unit\":\"mmol/L\"}],\"type\":\"Nephro\",\"formula\":\"0.6*a*(b/139)\"},{\"name\":\"FW Deficit(Adult Female/Elderly Male)\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Current Na\",\"unit\":\"mmol/L\"}],\"type\":\"Nephro\",\"formula\":\"0.5*a*(b/139)\"},{\"name\":\"FW Deficit(Elderly Female)\",\"variable\":[{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Current Na\",\"unit\":\"mmol/L\"}],\"type\":\"Nephro\",\"formula\":\"0.45*a*(b/139)\"},{\"name\":\"GFR Creatinine Clearance\",\"variable\":[{\"name\":\"Age\",\"unit\":\"year\"},{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Cr\",\"unit\":\"mcmol/L\"}],\"type\":\"Nephro\",\"formula\":\"(140-a)*b/(72*c)\"},{\"name\":\"GFR Creatinine Clearance (Female)\",\"variable\":[{\"name\":\"Age\",\"unit\":\"year\"},{\"name\":\"Weight\",\"unit\":\"kg.\"},{\"name\":\"Cr\",\"unit\":\"mcmol/L\"}],\"type\":\"Nephro\",\"formula\":\"(140-a)*b*0.85/(72*c)\"},{\"name\":\"GFR MDRD\",\"variable\":[{\"name\":\"SerumCr\",\"unit\":\"Scr/k,1\"},{\"name\":\"Age\",\"unit\":\"year\"}],\"type\":\"Nephro\",\"formula\":\"186*(1/(a**(1.154)))*(1/(b**(0.203)))*0.742\"},{\"name\":\"GFR CKD-EPI Male\",\"variable\":[{\"name\":\"Min\",\"unit\":\"Scr/k,1\"},{\"name\":\"Max\",\"unit\":\"Scr/k,1\"},{\"name\":\"Age\",\"unit\":\"year\"}],\"type\":\"Nephro\",\"formula\":\"141*(1/a*(0.411))*b-1.209*0.993*c\"},{\"name\":\"GFR CKD-EPI Female\",\"variable\":[{\"name\":\"Min\",\"unit\":\"Scr/k,1\"},{\"name\":\"Max\",\"unit\":\"Scr/k,1\"},{\"name\":\"Age\",\"unit\":\"year\"}],\"type\":\"Nephro\",\"formula\":\"141*(1/a*(0.329))*b-1.209*0.993*c*1.018\"},{\"name\":\"Rate (ml/hr)\",\"variable\":[{\"name\":\"IBW\",\"unit\":\"kg.\"},{\"name\":\"Dosage\",\"unit\":\"mcg/kg/min\"},{\"name\":\"Drug dilution\",\"unit\":\"mg/ml\"}],\"type\":\"Drugdose\",\"formula\":\"0.06*a*b/c\"},{\"name\":\"Dosage (mcg/kg/min)\",\"variable\":[{\"name\":\"Rate\",\"unit\":\"ml/hr\"},{\"name\":\"Drug dilution\",\"unit\":\"mg/ml\"},{\"name\":\"IBW\",\"unit\":\"kg.\"}],\"type\":\"Drugdose\",\"formula\":\"a*b/(0.06*c)\"},{\"name\":\"Predicted VT ARDSNET (ml)\",\"variable\":[{\"name\":\"target TV\",\"unit\":\"ml/kg\"},{\"name\":\"ideal BW\",\"unit\":\"kg.\"}],\"type\":\"Ventilator\",\"formula\":\"a*b\"},{\"name\":\"PF ratio\",\"variable\":[{\"name\":\"PaO2\",\"unit\":\"mmHg\"},{\"name\":\"FiO2\",\"unit\":\"%\"}],\"type\":\"Ventilator\",\"formula\":\"a/b\"}]}"
            
            if let data = jsonString.data(using: String.Encoding.utf8) {
                let json = JSON(data: data)
                
                for item in json["allFormula"].arrayValue {
                    let formula = Formula()
                    formula.id = UUID().uuidString
                    formula.name = item["name"].stringValue
                    formula.type = item["type"].stringValue
                    formula.formula = item["formula"].stringValue
                    for parameter in item["variable"].arrayValue{
                        let variableObject = VariableObject()
                        variableObject.name = parameter["name"].stringValue
                        variableObject.unit = parameter["unit"].stringValue
                        formula.variable.append(variableObject)
                    }
                    formulaList.append(formula)
                }
            }
            
            let realm = try! Realm()
            
            try! realm.write {
                
                for formula in formulaList{
                    realm.add(formula)
                }
            }
            
        }
        
    }
    
    func isAppHasBeenLaunched() -> Bool{
        let defualts = UserDefaults.standard
        
        if defualts.string(forKey: "isAppHasBeenLaunched") != nil {
            return false
        }else{
            defualts.set(true, forKey: "isAppHasBeenLaunched")
            return true
        }
    }
}
