//
//  OrderViewControllerBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/27/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class OrderViewControllerBase: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var allPriceButton: UIBarButtonItem!
    var btn_Title: UIButton!
    var txt_Search: UITextField!
    
    var listView = ListView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 500
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            
            revealViewController().rightViewRevealWidth = 500
            allPriceButton.target = revealViewController()
            allPriceButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
        addBtn_Title()
        addTxt_Search()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addListViewOrder()
        //setupListView()
        
        
    }
    
    func addTxt_Search()
    {
        txt_Search = UITextField()
        txt_Search.isHidden = true
        txt_Search.borderStyle = .roundedRect // bo tròn
        txt_Search.placeholder = "Enter Food Name here"
        txt_Search.tag = 1
        self.view.addSubview(txt_Search)
        
        txt_Search.translatesAutoresizingMaskIntoConstraints = false
        
        
        //constrain
        let cn1 = NSLayoutConstraint(item: txt_Search, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: txt_Search, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: txt_Search, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: txt_Search, attribute: .top, relatedBy: .equal, toItem: self.view, attribute:.top, multiplier: 1, constant: 64)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
    }
    
    func addBtn_Title()
    {
        btn_Title = UIButton()
        btn_Title.setTitle("Choose Table:", for: UIControlState())
        btn_Title.setTitleColor(UIColor.red, for: .highlighted)
        btn_Title.addTarget(self, action: #selector(chooseOrder), for: .touchUpInside)
        btn_Title.backgroundColor = UIColor(red: 255/255, green: 75/255, blue: 54/255, alpha: 0.5)
        self.view.addSubview(btn_Title)
        
        //contraint
        btn_Title.translatesAutoresizingMaskIntoConstraints = false
        // .leding cho no bên trái view tổng
        let cn1 = NSLayoutConstraint(item: btn_Title, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: btn_Title, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: btn_Title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        let cn4 = NSLayoutConstraint(item: btn_Title, attribute: .top, relatedBy: .equal, toItem: self.view, attribute:.top, multiplier: 1, constant: 64)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
    }
    
    
    @IBAction func btnSearch(_ sender: AnyObject) {
        if (txt_Search.isHidden == true)
                {
                    UIView.transition(with: self.txt_Search, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
                    listView.isHidden = true
                }
                else
                {
                    UIView.transition(with: self.txt_Search, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                }
        
                txt_Search.isHidden = !txt_Search.isHidden
                txt_Search.resignFirstResponder() // bỏ con trỏ nhấp nháy ở textfield

    }
    
    
    func chooseOrder()
    {
        print("Click")
    }
    
    
    
    
//# MARK: Listview
    func addListViewOrder ()
    {
        
        self.view.addSubview(listView)
        listView.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: listView, attribute: .centerX, relatedBy: .equal, toItem: btn_Title, attribute: .centerX, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: listView, attribute: .top, relatedBy: .equal, toItem: btn_Title, attribute: .bottom, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: listView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 400)
        let cn4 = NSLayoutConstraint(item: listView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 400)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
    }
    
    
    
    }


