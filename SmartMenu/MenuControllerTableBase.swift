//
//  MenuControllerTableBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/7/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//




import UIKit
class MenuControllerTableBase: MenuControllerBase
{
        var categoryTable: UITableView!
        var otherTable: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
            addCategoryTable()
             addOtherTable()
        }
    
        func addCategoryTable()
        {
    
            categoryTable = UITableView()
            categoryTable.backgroundColor = UIColor.red
            self.view.addSubview(categoryTable)
            self.categoryTable.translatesAutoresizingMaskIntoConstraints = false
    
            let cn1 = NSLayoutConstraint(item: categoryTable, attribute: .leading, relatedBy: .equal, toItem:self.view, attribute: .leading, multiplier: 1.0, constant: 0)
            let cn2 = NSLayoutConstraint(item: categoryTable, attribute: .trailing, relatedBy: .equal, toItem:self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
            let cn3 = NSLayoutConstraint(item: categoryTable, attribute: .top, relatedBy: .equal, toItem: button_Menu, attribute: .bottom, multiplier: 1.0, constant: 0)
            let cn4 = NSLayoutConstraint(item: categoryTable, attribute: .bottom, relatedBy: .equal, toItem: self.lbl_OtherFilter, attribute: .top, multiplier: 1.0, constant: 0)
            NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
    
        }
        func addOtherTable()
        {
    
            otherTable = UITableView()
            otherTable.backgroundColor = UIColor.red
            self.view.addSubview(otherTable)
            self.otherTable.translatesAutoresizingMaskIntoConstraints = false
    
            let cn1 = NSLayoutConstraint(item: otherTable, attribute: .leading, relatedBy: .equal, toItem:self.view, attribute: .leading, multiplier: 1.0, constant: 0)
            let cn2 = NSLayoutConstraint(item: otherTable, attribute: .trailing, relatedBy: .equal, toItem:self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
            let cn3 = NSLayoutConstraint(item: otherTable, attribute: .top, relatedBy: .equal, toItem: lbl_OtherFilter, attribute: .bottom, multiplier: 1.0, constant: 0)
            let cn4 = NSLayoutConstraint(item: otherTable, attribute: .bottom, relatedBy: .equal, toItem: button_Infor, attribute: .top, multiplier: 1.0, constant: 0)
            NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
            
        }
    
}

