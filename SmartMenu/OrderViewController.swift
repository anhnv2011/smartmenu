//
//  OrderViewController.swift
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

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class OrderViewController: OrderViewControllerTableBase {
    var numberOfFood: Int?
    var textFields:[UITextField] = []
    //var allCellsText = [String]()
    //var tupleFoodArray: [(foodID: String, numberFood: String?)] = []
    var food = [String]()
    var price = [String]()
    var discount = [String]()
    
    var foodID : String?
    
    var currentFoodId : Int = 0
    var currentPrice : Float = 0.0
    var currentDiscount : Float = 0.0
    
    var orderStatus: Int?
    var activeOrder: Int = 1
    var closeOrder: Int = 0
    
    var statementFilter = ""
    
    //
    
    var itemsOfListView:[Label]!
    
    
    
    var database = DataBase.sharedInstance
    
    var currentIndexTable = 1
    
    
    var valueDiscount = [String]()
    var items = [NSDictionary]()
    
    
    var itemsFood: [Food]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        txt_Search.tag = 1
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.listView.delegateSelected = self
        listView.isHidden = true
        //getDataTable("")
        
        setupListView()
        loadTitle(currentIndexTable)
        
    
        getDataFood(statementFilter)
        myTableView.register(OrderTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        getValueDiscountWithDiscountID()
        
        
        
        //textfield
        txt_Search.delegate = self // delegate for textfield
        textFields = [txt_Search]
        txt_Search.tag = 10000

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //getDataTable()
        setupListView()
       // getDataFood(statementFilter)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //getDataFood(statementFilter)

    }
//#MARK: ListView

     func setupListView() {
        itemsOfListView = getDataTable()
        listView.delegateSelected = self
        listView.items = itemsOfListView
        listView.typeListView = TypeListView.tables
    }
//
    
    override func chooseOrder() // ham viet ben viewcontrollerbase
    {
        if(listView.isHidden == true)
        {
            listView.isHidden = false
            //checkListViewHidden = false
        }
        else
        {
            listView.isHidden = true
            //checkListViewHidden = true
        }
    }
    
    
    
    //# MARK : GetData
    
    func getDataTable() -> [Label]
    {
        itemsOfListView = [Label]()
        
        let dicts = self.database.viewDatabase("TABLES", columns: ["*"], statement: "")
        for item in dicts
        {
            itemsOfListView.append(Label(displayTableName: item["TableName"] as! String, id:item["TableID"]as! Int, column: "TableID"))
        }
        return itemsOfListView
        
    }

    
    

    
    
   
    func getDataFood(_ statement: String)
    {
            items = self.database.viewDatabase("FOODS", columns: ["*"], statement: statement)
            //items = self.database.viewDatabase("SONGS", columns: ["*"], statement: statement)
            super.myTableView.reloadData()
    

    }
    
    
    
//#MARK Check
    
    func checkForAddOrder(_ tableID: Int ) -> Int
    {
        
            
            let value = database.viewDatabaseWithoutDistinct("ORDERS", columns: ["Paid"], statement: "Where TableID = \(tableID)")
            print("Paid la :\(value)")
            //value.first!["DiscountValue"]! as AnyObject).stringValue)
            let value2 = Int(((value.last!["Paid"]! as AnyObject).stringValue)!)!
        print("value 2 la: \(value2)")
            
        return value2
    }
    
    func checkForAddOrderDetail(_ orderID: Int, _ foodID: Int) -> Bool
    {
        let value = database.viewDatabase("ORDERDETAIL", columns: ["Quantity"], statement: "Where OrderID  = \(orderID) And FoodID = \(foodID)")
        
        print("2111111111111 \(value)")
        print("00000hhhhhh   \(value.count)")
        if value.count == 0
            
        {return false}
        return true
    }
    
    func loadTitle(_ index: Int)
    {
        
        btn_Title.setTitle(getTitleWithID(index), for: UIControlState())
    }
    func getTitleWithID(_ index: Int) -> String?
    {
        for label in itemsOfListView
        {
            if (label.id == index)
            {
                return label.displayTableName
            }
        }
        return nil
    }
    
//    func setupListView()
//    {
//        listView.items = itemsOfListView
//        loadTitle(currentIndexTable)
//    }
    
    func getValueDiscountWithDiscountID()
    {
        for discountid in items
        {
            let value = database.viewDatabase("DISCOUNTS", columns: ["DISCOUNTS.DiscountValue"], statement: "JOIN FOODS ON FOODS.DiscountID = DISCOUNTS.DiscountID where FOODS.DiscountID = \(discountid["DiscountID"]!)")
            //let discount = value.first!["DiscountValue"]!.stringValue
            //print(value)
            valueDiscount.append((value.first!["DiscountValue"]! as AnyObject).stringValue)
            //valueDiscount.append(value.first!["DiscountValue"] as! String)
            
        }
        
    }

}
extension OrderViewController: UITextFieldDelegate
{
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.tag != 1
        {
            let number = textField.text!
            
            let unitprice = currentPrice * (100 - currentDiscount) / 100
            
            let currentDate = Date()
                       if checkForAddOrder(currentIndexTable) == 1
            {
                database.insertDatabase("ORDERS", dict: ["TableID":"\(currentIndexTable)", "OrderDate" : "", "OrderStartTime" : "\(currentDate.toShortTimeString())", "Paid" : "0"])

                            }
                
            else
            {
                print("khong add them order moi")
            }
            let orderID = database.viewDatabase("ORDERS", columns: ["OrderID"], statement: "").last!["OrderID"] as! Int
            
            print("order id la : \(orderID)")
            print("fodd id la : \(currentFoodId)")
            if checkForAddOrderDetail(orderID, currentFoodId) == true
            {
                print("can update")
            
                let quantity = database.viewDatabase("ORDERDETAIL", columns: ["Quantity"], statement: "Where OrderID = \(orderID) AND FoodID = \(currentFoodId)").last!["Quantity"] as! Int
                let newQuantity = quantity + Int(number)!
                database.updateDatabase("ORDERDETAIL", colums: "Quantity", value: "\(newQuantity)", statement: "OrderID = \(orderID) AND FoodID = \(currentFoodId)")
            }
            else
            {
            
                print("tao moi")
                 database.insertDatabase("ORDERDETAIL", dict: ["Quantity":"\(number)", "isNew" : "1", "UnitPrice": "\(unitprice)","OrderID":"\(orderID)","FoodID": "\(currentFoodId)"])
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if(textField.tag == 10000)
        {
            var statement = ""
            //print(textField.text)
            if (string == "")
            {
                if (textField.text!.characters.count > 0)
                {
                    statement = (textField.text! as NSString).substring(to: textField.text!.characters.count - 1)
                }
                else
                {
                    statement = ""
                }
            }
            else
            {
                statement = "\(textField.text!)\(string)"
            }
            self.getDataFood("Where FoodName Like '\(statement)%'")
        }
            
            
            
        else
        {
            
            /* can input only number */
            let aSet = CharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: aSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
            
            /*Set range number food*/
            var startString = ""
            if (textField.text != nil)
            {
                startString += textField.text!
            }
            startString += string
            let limitNumber = Int(startString)
            if limitNumber > 10
            {
                return false
            }
            else
            {
                return true;
            }
        }
        
        //print("DSFSDGs")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
}

extension OrderViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "Cell") as! OrderTableViewCell
        let currentItem = items[(indexPath as NSIndexPath).row]
      
        //cell.img_Food.image = UIImage(named: currentItem["UrlImg"] as! String)
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let pathImage = paths[0].appendingPathComponent("image/\(currentItem["UrlImg"] as! String).png")
        let data = NSData(contentsOf: pathImage)
        cell.img_Food.image = UIImage(data: data! as Data)
        
        cell.lbl_FoodName.text = (currentItem.object(forKey: "FoodName") as! String)
        cell.lbl_Description.text = (currentItem.object(forKey: "Description") as! String)
        cell.lbl_FoodPrice.text =  "Price: " + String(describing: currentItem.object(forKey: "Price")!) + "$"
        cell.lbl_DiscountLable.text = "Discount:"
        
        
        let image:String = valueDiscount[(indexPath as NSIndexPath).row]
        cell.img_DiscountImage.image = UIImage.gifWithName("\(image)")
        
        var status = String(describing: currentItem["FoodStatus"]!)
        //let status = Int(String(describing: currentItem.object(forKey: "FoodStatus")!))
        print(status)
        if (status == "true")
        {
            cell.button_Order.setBackgroundImage(UIImage( named: "btnaddtoorder"), for: UIControlState())
        }
        if (status == "false")
        {
            cell.button_Order.setBackgroundImage(UIImage( named: "btnaddtoorder_disable"), for: UIControlState())
            cell.button_Order.isUserInteractionEnabled = false
        }
        
        foodID = String(describing: currentItem.object(forKey: "FoodID")!)
        food.append(foodID!)
        
        //
        price.append(String(describing: currentItem.object(forKey: "Price")!))
        discount.append(valueDiscount[(indexPath as NSIndexPath).row])
        
        cell.tf_number.delegate = self
        numberOfFood = Int(cell.tf_number.text!)
        cell.tf_number.tag = Int(foodID!)!
        return cell
    }

}

extension OrderViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("index: \(indexPath.row)")
        let currentcell = myTableView.cellForRow(at: indexPath) as! OrderTableViewCell
        currentcell.button_Order.isEnabled = true
        currentFoodId = Int(food[(indexPath as NSIndexPath).row])!
        currentPrice = Float(price[(indexPath as NSIndexPath).row])!
        currentDiscount = Float(discount[(indexPath as NSIndexPath).row])!
        
        //print("food: \(food[indexPath.row])")
        
    }
 
}

extension OrderViewController: SelectedItem
{
    func selectedTable(_ id: Int)
    {
        //print ("orderviewcon:  \(id)")
        //print(getTitleWithID(id))
        currentIndexTable = id
        loadTitle(currentIndexTable)
        
        
    }
}
