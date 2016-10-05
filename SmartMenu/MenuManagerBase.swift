//
//  MenuManagerBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/21/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class MenuManagerBase: UIViewController {

    var menuTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addMenu()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   func addMenu()
   {
    menuTable = UITableView()
    menuTable.backgroundColor = UIColor.red
    self.view.addSubview(menuTable)
    self.menuTable.translatesAutoresizingMaskIntoConstraints = false
    
    let cn1 = NSLayoutConstraint(item: menuTable, attribute: .leading, relatedBy: .equal, toItem:self.view, attribute: .leading, multiplier: 1.0, constant: 0)
    let cn2 = NSLayoutConstraint(item: menuTable, attribute: .trailing, relatedBy: .equal, toItem:self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
    let cn3 = NSLayoutConstraint(item: menuTable, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 64)
    let cn4 = NSLayoutConstraint(item: menuTable, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 10)
    NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

   }
}
