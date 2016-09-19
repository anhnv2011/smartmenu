//
//  AllPriceControllerBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class AllPriceControllerBase: UIViewController {
    
    var lbl_Order: UILabel!
    //var detailOrderTable: UITableView!
    var button_Submit: UIButton!
    var lbl_TotalCost: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLabelOrder()
        addButtonSubmit()
        //addDetailOrderTable()
        addTotalCost()
        
    }

    
    func addLabelOrder()
    {
        
        lbl_Order = UILabel()
        lbl_Order.text = "Your Order"
        
        self.view.addSubview(lbl_Order)
        //contraint
        lbl_Order.translatesAutoresizingMaskIntoConstraints = false
        // .leding cho no bên trái view tổng
        let cn1 = NSLayoutConstraint(item: lbl_Order, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 100)
        let cn2 = NSLayoutConstraint(item: lbl_Order, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 20)
        let cn3 = NSLayoutConstraint(item: lbl_Order, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: lbl_Order, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 200)
        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])

        
    }
    
//    func addDetailOrderTable()
//    {
//    
//        detailOrderTable = UITableView(frame: CGRectMake(0, 0, 100, 100))
//        detailOrderTable.backgroundColor = UIColor.greenColor()
//        self.view.addSubview(detailOrderTable)
//        self.detailOrderTable.translatesAutoresizingMaskIntoConstraints = false
//        
//        let cn1 = NSLayoutConstraint(item: detailOrderTable, attribute: .Leading, relatedBy: .Equal, toItem:self.view, attribute: .Leading, multiplier: 1.0, constant: 0)
//        let cn2 = NSLayoutConstraint(item: detailOrderTable, attribute: .Trailing, relatedBy: .Equal, toItem:self.view, attribute: .Trailing, multiplier: 1.0, constant: 0)
//        let cn3 = NSLayoutConstraint(item: detailOrderTable, attribute: .Top, relatedBy: .Equal, toItem: lbl_Order, attribute: .Bottom, multiplier: 1.0, constant: 0)
//        let cn4 = NSLayoutConstraint(item: detailOrderTable, attribute: .Bottom, relatedBy: .Equal, toItem: self.button_Submit, attribute: .Top, multiplier: 1.0, constant: 0)
//        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])
//    
//    }
    
    
    func addButtonSubmit()
    {
        button_Submit = UIButton()
        button_Submit.setTitle("Subbmit", forState: .Normal)
        button_Submit.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        button_Submit.addTarget(self, action: #selector(submitOrder), forControlEvents: .TouchUpInside)
        button_Submit.backgroundColor = UIColor(red: 255/255, green: 75/255, blue: 54/255, alpha: 0.5)
        self.view.addSubview(button_Submit)
        
        //contraint
        button_Submit.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: button_Submit, attribute: .Leading, relatedBy: .Equal, toItem: lbl_Order, attribute: .Leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: button_Submit, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        let cn3 = NSLayoutConstraint(item: button_Submit, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: button_Submit, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute:.Bottom, multiplier: 1, constant: -20)
        
        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])

    }
    
    func addTotalCost()
    {
        lbl_TotalCost = UILabel()
        lbl_TotalCost.text = "Paid:"
        
        self.view.addSubview(lbl_TotalCost)
        //contraint
        lbl_TotalCost.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_TotalCost, attribute: .Leading, relatedBy: .Equal, toItem: button_Submit, attribute: .Trailing, multiplier: 1.0, constant: 50)
        let cn2 = NSLayoutConstraint(item: lbl_TotalCost, attribute: .Trailing, relatedBy: .Equal, toItem: self.view, attribute: .Trailing, multiplier: 1.0, constant: 10)
        let cn3 = NSLayoutConstraint(item: lbl_TotalCost, attribute: .Top, relatedBy: .Equal, toItem: button_Submit, attribute: .Top, multiplier: 1, constant: 0)
        let cn4 = NSLayoutConstraint(item: lbl_TotalCost, attribute: .Bottom, relatedBy: .Equal, toItem: button_Submit, attribute: .Bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])

    }
    
    func submitOrder()
    {
    
    }

}
