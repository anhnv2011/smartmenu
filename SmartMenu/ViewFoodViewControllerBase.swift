//
//  ViewFoodViewControllerBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/22/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewFoodViewControllerBase: UIViewController {

    var tf_Search: UITextField!
    var viewFoodTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addtfSearch()
        addViewFoodTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addtfSearch()
    {
        tf_Search = UITextField()
        //tf_Search.isHidden = true
        tf_Search.borderStyle = .roundedRect // bo tròn
        tf_Search.placeholder = "Enter Food Name here"
        tf_Search.tag = 1
        self.view.addSubview(tf_Search)
        
        tf_Search.translatesAutoresizingMaskIntoConstraints = false
        
        
        //constrain
        let cn1 = NSLayoutConstraint(item: tf_Search, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: tf_Search, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: tf_Search, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: tf_Search, attribute: .top, relatedBy: .equal, toItem: self.view, attribute:.top, multiplier: 1, constant: 64)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }

    
    func addViewFoodTable()
    {
        viewFoodTable = UITableView()

        self.view.addSubview(viewFoodTable)
        self.viewFoodTable.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: viewFoodTable, attribute: .leading, relatedBy: .equal, toItem:self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: viewFoodTable, attribute: .trailing, relatedBy: .equal, toItem:self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: viewFoodTable, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 104) // 40 (chieu cao cua textfield) + 64 cach top
        let cn4 = NSLayoutConstraint(item: viewFoodTable, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
