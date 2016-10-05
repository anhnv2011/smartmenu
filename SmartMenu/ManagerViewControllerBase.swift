//
//  ManagerViewControllerBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/22/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ManagerViewControllerBase: UIViewController {

    var lbl_Title: UILabel!
    var collection_Table: UICollectionView!
    var showLblTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        showLblTitle = "Table"
        addLabelTitle()
        //addTableCollectionView()
    }

    
    func addLabelTitle()
    {
        
        lbl_Title = UILabel()
        lbl_Title.text = showLblTitle
        lbl_Title.textColor = UIColor.red
        lbl_Title.font = UIFont(name: "Avenir-Light", size: 30)
        self.view.addSubview(lbl_Title)
        //contraint
        lbl_Title.translatesAutoresizingMaskIntoConstraints = false
        // .leding cho no bên trái view tổng
//        label.font = UIFont(name: label.font.fontName, size: 20)

        let cn1 = NSLayoutConstraint(item: lbl_Title, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 100)
        let cn2 = NSLayoutConstraint(item: lbl_Title, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 80)
        let cn3 = NSLayoutConstraint(item: lbl_Title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: lbl_Title, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
        
    }
    
    func addTableCollectionView()
    {
        collection_Table = UICollectionView()
        collection_Table.backgroundColor = UIColor.blue
        self.view.addSubview(collection_Table)
        
        collection_Table.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: collection_Table, attribute: .top, relatedBy: .equal, toItem: lbl_Title, attribute: .bottom, multiplier: 1.0, constant: 10)
        let cn2 = NSLayoutConstraint(item: collection_Table, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 10)
        let cn3 = NSLayoutConstraint(item: collection_Table, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 10)
        let cn4 = NSLayoutConstraint(item: collection_Table, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 10)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
