//
//  AllPriceControllerBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class AllOrderControllerBase: UIViewController {
    
    var lbl_Order: UILabel!
    //var detailOrderTable: UITableView!
    var button_Submit: UIButton!
    var lbl_TotalCost: UILabel!
    
    
    var items = [NSDictionary]()
    var database = DataBase.sharedInstance
    var itemsOfListView:[Label]!
    
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
        let cn1 = NSLayoutConstraint(item: lbl_Order, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 100)
        let cn2 = NSLayoutConstraint(item: lbl_Order, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 20)
        let cn3 = NSLayoutConstraint(item: lbl_Order, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: lbl_Order, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

        
    }
    
    
    
    func addButtonSubmit()
    {
        button_Submit = UIButton()
        button_Submit.setTitle("Subbmit", for: UIControlState())
        button_Submit.setTitleColor(UIColor.red, for: .highlighted)
        button_Submit.addTarget(self, action: #selector(submitOrder), for: .touchUpInside)
        button_Submit.backgroundColor = UIColor(red: 255/255, green: 75/255, blue: 54/255, alpha: 0.5)
        self.view.addSubview(button_Submit)
        
        //contraint
        button_Submit.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: button_Submit, attribute: .leading, relatedBy: .equal, toItem: lbl_Order, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: button_Submit, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        let cn3 = NSLayoutConstraint(item: button_Submit, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: button_Submit, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute:.bottom, multiplier: 1, constant: -20)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
    
    func addTotalCost()
    {
        lbl_TotalCost = UILabel()
        lbl_TotalCost.text = "Paid:"
        
        self.view.addSubview(lbl_TotalCost)
        //contraint
        lbl_TotalCost.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_TotalCost, attribute: .leading, relatedBy: .equal, toItem: button_Submit, attribute: .trailing, multiplier: 1.0, constant: 50)
        let cn2 = NSLayoutConstraint(item: lbl_TotalCost, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 10)
        let cn3 = NSLayoutConstraint(item: lbl_TotalCost, attribute: .top, relatedBy: .equal, toItem: button_Submit, attribute: .top, multiplier: 1, constant: 0)
        let cn4 = NSLayoutConstraint(item: lbl_TotalCost, attribute: .bottom, relatedBy: .equal, toItem: button_Submit, attribute: .bottom, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
    
    func submitOrder()
    {
    
    }

}
