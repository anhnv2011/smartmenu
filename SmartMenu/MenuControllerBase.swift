//
//  MenuControllerBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/6/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//


import UIKit

class MenuControllerBase: UIViewController{
    
    var button_Menu: UIButton!
    var lbl_OtherFilter: UILabel!
    var button_Infor: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonMenu()
        addOtherFilter()
        //addBtn_Title()
        addButtonInfor()
    }

    
      

    
    
    func addButtonMenu()
    {

        button_Menu = UIButton()
        button_Menu.setTitle("All Menu:", for: UIControlState())
        button_Menu.setTitleColor(UIColor.red, for: .highlighted)
        button_Menu.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left

        button_Menu.addTarget(self, action: #selector(clickMenu), for: .touchUpInside)
        button_Menu.backgroundColor = UIColor(red: 255/255, green: 75/255, blue: 54/255, alpha: 0.5)
        self.view.addSubview(button_Menu)
        
        //contraint
        button_Menu.translatesAutoresizingMaskIntoConstraints = false
        // .leding cho no bên trái view tổng
        let cn1 = NSLayoutConstraint(item: button_Menu, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: button_Menu, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: button_Menu, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: button_Menu, attribute: .top, relatedBy: .equal, toItem: self.view, attribute:.top, multiplier: 1, constant: 64)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }

    func clickMenu()
    {
    
    }
    
    func addOtherFilter()
    
    {
        lbl_OtherFilter = UILabel()
        lbl_OtherFilter.text = "Other Filter"
        lbl_OtherFilter.textAlignment = .left
        lbl_OtherFilter.backgroundColor = UIColor(red: 255/255, green: 75/255, blue: 54/255, alpha: 0.5)
        self.view.addSubview(lbl_OtherFilter)
        //contraint
        lbl_OtherFilter.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_OtherFilter, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: lbl_OtherFilter, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: (self.view.frame.height / 2) + 100)
        let cn3 = NSLayoutConstraint(item: lbl_OtherFilter, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: lbl_OtherFilter, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    
    }
    func addButtonInfor()
    {
        button_Infor = UIButton()
//        button_Infor.setTitle("Infor:", forState: .Normal)
//        button_Infor.setTitleColor(UIColor.redColor(), forState: .Highlighted)
        button_Infor.backgroundColor = UIColor(red: 255/255, green: 75/255, blue: 54/255, alpha: 0.5)
        button_Infor.setBackgroundImage(UIImage(named: "btnmore"), for: UIControlState())
        button_Infor.addTarget(self, action: #selector(showMore), for: .touchUpInside)
        self.view.addSubview(button_Infor)
        
        //contraint
        button_Infor.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: button_Infor, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        let cn2 = NSLayoutConstraint(item: button_Infor, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: button_Infor, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: button_Infor, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute:.bottom, multiplier: 1, constant: 10)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        

    }
    
    func showMore()
    {
    
    }
}
