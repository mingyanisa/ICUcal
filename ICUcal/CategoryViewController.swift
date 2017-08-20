//
//  CategoryViewController.swift
//  ICUcal
//
//  Created by Admin on 8/19/2560 BE.
//  Copyright © 2560 Thinc. All rights reserved.
//

import UIKit

class CategoryViewController : UICollectionViewController,UICollectionViewDelegateFlowLayout{
    fileprivate let itemsPerRow: CGFloat = 4
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    var type = ["General","Hemodynamic","EKG","Nutrition","Nephro","Drugdose","Ventilator","Scoring Systems"]
    var pic = [#imageLiteral(resourceName: "General"),#imageLiteral(resourceName: "Hemodynamic"),#imageLiteral(resourceName: "EKG"),#imageLiteral(resourceName: "Nutrition"),#imageLiteral(resourceName: "Nephro"),#imageLiteral(resourceName: "Drug Dose"),#imageLiteral(resourceName: "Scoring"),#imageLiteral(resourceName: "Scoring")]
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return type.count
    }
    
    // 2
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryViewCell
        cell.catagory.text = type[indexPath.row]
        cell.imageView.image =  pic[indexPath.row]
        return cell 
    }
    
    // 3
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
        performSegue(withIdentifier: "enterformula", sender: type[indexPath.row])
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier {
            case "enterformula":
                let destination = segue.destination as! FormulaViewController
                destination.type = sender as? String
                break
            default:
                break
            }
        }
    }
    
}
class CategoryViewCell: UICollectionViewCell {
    @IBOutlet weak var catagory: UILabel!
    @IBOutlet weak var imageView: UIImageView!

}
