//
//  TableViewCell.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/26/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class OrderTableViewCell: UITableViewCell, UITextFieldDelegate {

//    @IBOutlet weak var img_Food: UIImageView!
//    @IBOutlet weak var lbl_FoodName: UILabel!
//    @IBOutlet weak var lbl_Description: UILabel!
//    @IBOutlet weak var lbl_FoodPrice: UILabel!
//    @IBOutlet weak var img_DiscountImage: UIImageView!
//    @IBOutlet weak var button_Order: NSLayoutConstraint!
    
    
    
    
    var img_Food: UIImageView!
    var lbl_FoodName: UILabel!
    var lbl_Description: UILabel!
    var lbl_FoodPrice: UILabel!
    var lbl_DiscountLable: UILabel!
    var img_DiscountImage: UIImageView!
    var button_Order: UIButton!
    var button_add: UIButton!
    var button_sub: UIButton!
    var tf_number: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        tf_number.delegate = self
        tf_number.keyboardType = .numberPad

    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
    // khi chay ham myTableView.registerClass(TableViewCellBase.self, forCellReuseIdentifier: "Cell")
    // ben ViewControllerTableBase se init ham nay
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addImgFood()
        addFoodName()
        addDescription()
        addFoodPrice()
        addDiscountLabel()
        addDiscountImage()
        addOrderButton()
        addAddButton()
        addSubButton()
        addNumberFoodTextfield()
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
    }
    
    func addImgFood()
    {
        img_Food = UIImageView()
        img_Food.contentMode = .scaleToFill
        self.contentView.addSubview(img_Food)
        img_Food.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: img_Food, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 5)
        let cn2 = NSLayoutConstraint(item: img_Food, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        
        let cn3 = NSLayoutConstraint(item: img_Food, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let cn4 = NSLayoutConstraint(item: img_Food, attribute: .width, relatedBy: .equal, toItem: nil, attribute:.notAnAttribute, multiplier: 1.0, constant: 200)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
    func addFoodName()
    {
        lbl_FoodName = UILabel()
        self.contentView.addSubview(lbl_FoodName)
        lbl_FoodName.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_FoodName, attribute: .leading, relatedBy: .equal, toItem: img_Food, attribute: .trailing, multiplier: 1.0, constant: 2)
        let cn2 = NSLayoutConstraint(item: lbl_FoodName, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 5)
        
        let cn3 = NSLayoutConstraint(item: lbl_FoodName, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 35)
        
        let cn4 = NSLayoutConstraint(item: lbl_FoodName, attribute:  .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -300)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
    }
    func addDescription()
    {
        lbl_Description = UILabel()
        self.contentView.addSubview(lbl_Description)
        lbl_Description.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_Description, attribute: .leading, relatedBy: .equal, toItem: img_Food, attribute: .trailing, multiplier: 1.0, constant: 2)
        let cn2 = NSLayoutConstraint(item: lbl_Description, attribute: .top, relatedBy: .equal, toItem: lbl_FoodName, attribute: .bottom, multiplier: 1.0, constant: 10)
        
        let cn3 = NSLayoutConstraint(item: lbl_Description, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 35)
        
        let cn4 = NSLayoutConstraint(item: lbl_Description, attribute:  .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: -10)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
    }
    
    func addFoodPrice()
    {
        lbl_FoodPrice = UILabel()
        self.contentView.addSubview(lbl_FoodPrice)
        lbl_FoodPrice.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_FoodPrice, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 5)
        let cn2 = NSLayoutConstraint(item: lbl_FoodPrice, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: 10)
        let cn3 = NSLayoutConstraint(item: lbl_FoodPrice, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 35)
        let cn4 = NSLayoutConstraint(item: lbl_FoodPrice, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
    }
    
    func addDiscountLabel()
    {
        lbl_DiscountLable = UILabel()
        self.contentView.addSubview(lbl_DiscountLable)
        lbl_DiscountLable.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: lbl_DiscountLable, attribute: .leading, relatedBy: .equal, toItem: img_Food, attribute: .trailing, multiplier: 1.0, constant: 2)
        let cn2 = NSLayoutConstraint(item: lbl_DiscountLable, attribute: .top, relatedBy: .equal, toItem: lbl_Description, attribute: .bottom, multiplier: 1.0, constant: 10)
        
        let cn3 = NSLayoutConstraint(item: lbl_DiscountLable, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 35)
        
        let cn4 = NSLayoutConstraint(item: lbl_DiscountLable, attribute:  .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

        
    }
    
    func addDiscountImage()
    {
        img_DiscountImage = UIImageView()
        self.contentView.addSubview(img_DiscountImage)
        img_DiscountImage.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: img_DiscountImage, attribute: .leading, relatedBy: .equal, toItem: lbl_DiscountLable, attribute: .trailing, multiplier: 1.0, constant: 2)
        
        let cn2 = NSLayoutConstraint(item: img_DiscountImage, attribute: .top, relatedBy: .equal, toItem: lbl_DiscountLable, attribute: .top, multiplier: 1.0, constant: 0)
        
        let cn3 = NSLayoutConstraint(item: img_DiscountImage, attribute: .bottom, relatedBy: .equal, toItem: lbl_DiscountLable, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let cn4 = NSLayoutConstraint(item: img_DiscountImage, attribute: .width , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
    
    func addOrderButton()
    {
        
//        btn_Title = UIButton()
//        btn_Title.setTitle("Choose Table:", forState: .Normal)
//        btn_Title.setTitleColor(UIColor.redColor(), forState: .Highlighted)
//        btn_Title.addTarget(self, action: #selector(chooseOrder), forControlEvents: .TouchUpInside)
//        btn_Title.backgroundColor = UIColor(red: 255/255, green: 75/255, blue: 54/255, alpha: 0.5)
//        self.view.addSubview(btn_Title)
        button_Order = UIButton()
        button_Order.isEnabled = false
        button_Order.setBackgroundImage(UIImage(named: "btnaddtoorder"), for: UIControlState())
        button_Order.addTarget(self, action: #selector(chooseAddOrder), for: .touchUpInside)

        //button_Order.hidden = true
        
        self.contentView.addSubview(button_Order)
        button_Order.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: button_Order, attribute: .top, relatedBy: .equal, toItem: lbl_DiscountLable, attribute: .top, multiplier: 1.0, constant: 0)
        
        let cn2 = NSLayoutConstraint(item: button_Order, attribute: .bottom, relatedBy: .equal, toItem: lbl_DiscountLable, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let cn3 = NSLayoutConstraint(item: button_Order, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: 10)
        
        let cn4 = NSLayoutConstraint(item: button_Order, attribute: .width , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    
    }
    
    func addAddButton()
    {
        button_add = UIButton()
        //button_add.setBackgroundImage(UIImage(named: "btnaddtoorder"), forState: .Normal)
        button_add.setTitle("+", for: UIControlState())
        button_add.setTitleColor(UIColor.red, for: UIControlState())
        
        button_add.isHidden = true
        

        button_add.addTarget(self, action: #selector(addNumberOfTextfield), for: .touchUpInside)
        
        self.contentView.addSubview(button_add)
        button_add.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: button_add, attribute: .top, relatedBy: .equal, toItem: button_Order, attribute: .top, multiplier: 1.0, constant: 0)
        
        let cn2 = NSLayoutConstraint(item: button_add, attribute: .bottom, relatedBy: .equal, toItem: button_Order, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let cn3 = NSLayoutConstraint(item: button_add, attribute: .trailing, relatedBy: .equal, toItem: button_Order, attribute: .trailing, multiplier: 1.0, constant: 0)
        
        let cn4 = NSLayoutConstraint(item: button_add, attribute: .width , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
    func addSubButton()
    {
        button_sub = UIButton()
        button_sub.setTitle("-", for: UIControlState())
        button_sub.setTitleColor(UIColor.red, for: UIControlState())
        button_sub.isHidden = true
        self.contentView.addSubview(button_sub)
        button_sub.addTarget(self, action: #selector(subNumberOfTextfield), for: .touchUpInside)
        
        button_sub.translatesAutoresizingMaskIntoConstraints = false
        let cn1 = NSLayoutConstraint(item: button_sub, attribute: .top, relatedBy: .equal, toItem: button_Order, attribute: .top, multiplier: 1.0, constant: 0)
        
        let cn2 = NSLayoutConstraint(item: button_sub, attribute: .bottom, relatedBy: .equal, toItem: button_Order, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let cn3 = NSLayoutConstraint(item: button_sub, attribute: .leading, relatedBy: .equal, toItem: button_Order, attribute: .leading, multiplier: 1.0, constant: 0)
        
        let cn4 = NSLayoutConstraint(item: button_sub, attribute: .width , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 60)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
    func addNumberFoodTextfield()
    {
        tf_number = UITextField()
        tf_number.borderStyle = .roundedRect // bo tròn
        tf_number.placeholder = "Number"
        //tf_number.addTarget(self, action: #selector(getNumberFood), forControlEvents: .EditingDidEnd)
        tf_number.isHidden = true
        self.contentView.addSubview(tf_number)
        
        tf_number.translatesAutoresizingMaskIntoConstraints = false

        let cn1 = NSLayoutConstraint(item: tf_number, attribute: .top, relatedBy: .equal, toItem: button_Order, attribute: .top, multiplier: 1.0, constant: 0)
        
        let cn2 = NSLayoutConstraint(item: tf_number, attribute: .bottom, relatedBy: .equal, toItem: button_Order, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        let cn3 = NSLayoutConstraint(item: tf_number, attribute: .trailing, relatedBy: .equal, toItem: button_add, attribute: .leading, multiplier: 1.0, constant: 0)
        
        let cn4 = NSLayoutConstraint(item: tf_number, attribute: .leading , relatedBy: .equal, toItem: button_sub, attribute: .trailing, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])

    }
    
    
//#MARK: Function Action
    func chooseAddOrder ()
    {
        print("ADD")
        button_Order.isHidden = true
        button_add.isHidden = false
        button_sub.isHidden = false
        tf_number.isHidden = false
//        button_add.enabled = true
//        button_sub.enabled = true
        //tf_number.hidden = false
    }

    
//    let alert = UIAlertController(title: "Game Over", message: "You Lose", preferredStyle: UIAlertControllerStyle.Alert)
//    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
//    self.presentViewController(alert, animated: true, completion: nil)

    func addNumberOfTextfield()
    {
        var num = Int(tf_number.text!)
        if  (num >= 0)
        {
        num = num! + 1
        tf_number.text = String(num!)
        print("+")
        }
        
        
    }
    
    func subNumberOfTextfield()
    {
        print("-")
        var num = Int(tf_number.text!)
        if (num >= 1)
       {
            num = num! - 1
            tf_number.text = String(num!)
        }
        
        

    }
    
    func getNumberFood()
    {
        print("So mon an la: \(tf_number.text!)")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = CharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
        
    }
//    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
//        textField.resignFirstResponder()
//        print("So mon an la: \(tf_number.text!)")
//
//        return true
//    }
    
    
}


