//
//  TableCollectionViewCell.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 10/1/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var detailOrderTable: UITableView!
  
    @IBOutlet weak var lb_NumberFoodActive: UILabel!
    
    
    var database = DataBase.sharedInstance
    var itemsOrderDetail = [OrderDetail]()
    var numberFoodActive = 0
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailOrderTable.delegate = self
        detailOrderTable.dataSource = self
        
        detailOrderTable.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "CellTable")
        
    }
   
  
    
    func getOrderIdWithTableName(tableName: String) -> Int
    {
        let tableID = database.viewDatabase("TABLES", columns: ["TableID"], statement: "Where TableName = '\(tableName)'")
        let tableID2 = Int(((tableID.first!["TableID"]! as AnyObject).stringValue)!)!
        
        let orderId = database.viewDatabase("ORDERS", columns: ["OrderID"], statement: "Where TableID = '\(tableID2)'")
        let orderId2 = Int(((orderId.last!["OrderID"]! as AnyObject).stringValue)!)!
        //print(orderId)
        return orderId2
    }
    
    func getFoodNameWithFoodID(foodId: Int) -> String
        
    {
    
        let food = database.viewDatabase("FOODS", columns: ["FoodName"], statement: "Where FoodID = '\(foodId)'")
        let food2 = ((food.last!["FoodName"]!))
        return food2 as! String
    }
    

    
    func getOrderDetailData(_ statement: String)
    {
        itemsOrderDetail.removeAll()
//        itemsOrderDetail = [OrderDetail]()
        let dict = self.database.viewDatabase("ORDERDETAIL", columns: ["*"], statement: statement)
        for item in dict
        {
        itemsOrderDetail.append(OrderDetail(orderId: item["OrderID"] as! Int , foodId: item["FoodID"] as! Int, quantity: item["Quantity"] as! Int, unitPrice: item["UnitPrice"] as! Float, isNew: item["isNew"] as! Bool))
            if item["isNew"] as! Bool == true
            {
                numberFoodActive = numberFoodActive + 1
            }
        }
        
//        for i in itemsOrderDetail
//        {
//            if i.isNew == true
//            {
//                numberFoodActive = numberFoodActive + 1
//            }
//        }
        print(numberFoodActive)
        
        lb_NumberFoodActive.text = String(numberFoodActive)
        self.detailOrderTable.reloadData()
    }
}

extension TableCollectionViewCell: UITableViewDataSource
    {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemsOrderDetail.count
            
        }
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = detailOrderTable.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! DetailTableViewCell


            let currentItem = itemsOrderDetail[indexPath.row]

            
            cell.lb_FoodName.text = String(getFoodNameWithFoodID(foodId: currentItem.foodId))
            cell.lb_NumberFood.text = "x" + String(currentItem.quantity)
            
            if currentItem.isNew == true
            {
                cell.image_Status.image = UIImage(named: "green")
                numberFoodActive = numberFoodActive + 1
            }
            else
            {
                cell.image_Status.image = UIImage(named: "red")
            }
//            print(numberFoodActive)

            return cell
            
            
            
        }
}

extension TableCollectionViewCell: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("asdasfndsljgnflsngsdfb")
    }
}
























//    var name : String = ""
//    {
//        didSet
//        {
//            nameLabel.text = name
//        }
//    }
//

