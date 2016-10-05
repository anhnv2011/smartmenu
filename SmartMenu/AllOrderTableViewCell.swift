//
//  AllOrderTableViewCell.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
class AllOrderTableViewCell: UITableViewCell {
    var lbl_FoodName: UILabel!
    var lbl_Quantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        addFoodName()
        addQuantity()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
    }
    
    
    func addFoodName()
    {
        
        lbl_FoodName = UILabel()
        lbl_FoodName.text = "Foodname"
        self.contentView.addSubview(lbl_FoodName)
        //self.lbl_FoodName.addSubview(lbl_FoodName)
        lbl_FoodName.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_FoodName, attribute: .leading, relatedBy: .equal, toItem: self.contentView , attribute: .leading, multiplier: 1.0, constant: 80)
        let cn2 = NSLayoutConstraint(item: lbl_FoodName, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 5)
        
        let cn3 = NSLayoutConstraint(item: lbl_FoodName, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 5)
        
        let cn4 = NSLayoutConstraint(item: lbl_FoodName, attribute:  .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
    
    func addQuantity()
    {
        lbl_Quantity = UILabel()
        lbl_Quantity.text = "Quantity"
        
        self.contentView.addSubview(lbl_Quantity)
        //self.lbl_Quantity.addSubview(lbl_Quantity)
        lbl_Quantity.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_Quantity, attribute: .trailing,relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -30)
        let cn2 = NSLayoutConstraint(item: lbl_Quantity, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 5)
        
        let cn3 = NSLayoutConstraint(item: lbl_Quantity, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 5)
        
        let cn4 = NSLayoutConstraint(item: lbl_Quantity, attribute:  .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60)

        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
}
