//
//  AllPriceControllerTableBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
class AllPriceControllerTableBase: AllPriceControllerBase
{
    var detailOrderTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addDetailOrderTable()

    }

    func addDetailOrderTable()
    {
        
        detailOrderTable = UITableView(frame: CGRectMake(0, 0, 100, 100))
        detailOrderTable.backgroundColor = UIColor.greenColor()
        self.view.addSubview(detailOrderTable)
        self.detailOrderTable.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: detailOrderTable, attribute: .Leading, relatedBy: .Equal, toItem:self.view, attribute: .Leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: detailOrderTable, attribute: .Trailing, relatedBy: .Equal, toItem:self.view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: detailOrderTable, attribute: .Top, relatedBy: .Equal, toItem: lbl_Order, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let cn4 = NSLayoutConstraint(item: detailOrderTable, attribute: .Bottom, relatedBy: .Equal, toItem: self.button_Submit, attribute: .Top, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activateConstraints([cn1, cn2, cn3, cn4])
        
    }

}
