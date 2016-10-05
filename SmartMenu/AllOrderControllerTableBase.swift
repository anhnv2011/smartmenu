//
//  AllPriceControllerTableBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
class AllOrderControllerTableBase: AllOrderControllerBase
{
    var detailOrderTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addDetailOrderTable()

    }

    func addDetailOrderTable()
    {
        
        detailOrderTable = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        detailOrderTable.backgroundColor = UIColor.green
        self.view.addSubview(detailOrderTable)
        self.detailOrderTable.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: detailOrderTable, attribute: .leading, relatedBy: .equal, toItem:self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: detailOrderTable, attribute: .trailing, relatedBy: .equal, toItem:self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: detailOrderTable, attribute: .top, relatedBy: .equal, toItem: lbl_Order, attribute: .bottom, multiplier: 1.0, constant: 0)
        let cn4 = NSLayoutConstraint(item: detailOrderTable, attribute: .bottom, relatedBy: .equal, toItem: self.button_Submit, attribute: .top, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
    }

}
