//
//  OrderViewTableBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/27/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
class OrderViewControllerTableBase: OrderViewControllerBase {
    
    var myTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addTableView()
    }
    func addTableView()
    {
        //myTableView.backgroundColor = UIColor(red: 255/255, green: 75/255, blue: 54/255, alpha: 1)
        self.view.addSubview(myTableView)
        self.myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: myTableView, attribute: .leading, relatedBy: .equal, toItem:self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: myTableView, attribute: .trailing, relatedBy: .equal, toItem:self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: myTableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 104) // 40 (chieu cao cua textfield) + 64 cach top
        let cn4 = NSLayoutConstraint(item: myTableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
    }
    
    

    
    
   
    
}
