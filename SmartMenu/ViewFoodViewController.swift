//
//  ViewFoodViewController.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/22/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewFoodViewController: ViewFoodViewControllerBase {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
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
    
    
    var database = DataBase.sharedInstance
    
    var currentIndexTable = 1
    
    
    var valueDiscount = [String]()

    var itemsFood = [Food]()
    
    var baseImageUrl: URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 500
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        }
        
        self.viewFoodTable.delegate = self
        self.viewFoodTable.dataSource = self
        viewFoodTable.register(OrderTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //textfield
        tf_Search.delegate = self // delegate for textfield
        //textFields = [txt_Search]
        getDataFood("")

        
    }
    


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getDataFood("")
        self.viewFoodTable.reloadData()
    }

    @IBAction func button_Add(_ sender: AnyObject) {
        let addFood = AddViewControllerBase(nibName: "AddViewControllerBase", bundle: nil)
        displayContentController(addFood)
        addFood.delegate = self
        viewFoodTable.reloadData()
    }
    
    //#MARK:  getdata
    
    func getDataFood(_ statement: String) // -> [Food]
    {
    
        itemsFood = [Food]()
        
        let dicts = self.database.viewDatabase("FOODS", columns: ["*"], statement: "")
        for item in dicts
        {
            let foodStatusTitle = item["FoodStatus"] as! NSString
            
            var foodStatus:Bool
            if foodStatusTitle == "true" {
                foodStatus = true
                
            }
            else
            {
                foodStatus = false
            }
            
            itemsFood.append(Food(foodId: item["FoodID"] as! Int, foodName: item["FoodName"] as! NSString, descript: item["Description"] as! NSString
                , price: item["Price"] as! Float, foodStatus: foodStatus, urlImg: item["UrlImg"] as! NSString, categoryId: item["CategoryID"] as! Int
                , discountId: item["DiscountID"] as! Int))
        }
        
                self.viewFoodTable.reloadData()
                
        
        //return itemsFood


    }


    
    func getValueDiscount(discountId: Int) -> String {
        
        
            let value = database.viewDatabase("DISCOUNTS", columns: ["DiscountValue"], statement: "Where DiscountID = \(discountId)")
            let value2 = ((value.first!["DiscountValue"]! as AnyObject).stringValue)!
        
        return value2
    }
    
    func getImageDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let Directory = paths[0].appendingPathComponent("image")
        return Directory
    }
    
   
    
    
    func editFood(foodID: Int, foodName: String, description: String, price: Float, foodStatus: Bool, urlImg: String, categoryID: Int, discountID: Int)
    {
        let editFood = AddViewControllerBase(nibName: "AddViewControllerBase", bundle: nil)
        editFood.titleButton = "Edit"
        editFood.currentFoodId = foodID
        editFood.currentFoodName = foodName
        editFood.currentDescription = description
        editFood.currentPrice = price
        editFood.currentStatus = foodStatus
        editFood.currentCategogy = categoryID
        editFood.currentDiscount = discountID
        editFood.currentImage = urlImg
        displayContentController(editFood)
        
        //print(foodID, foodName, description, price, foodStatus, categoryID, discountID)
    }
    
    func deleteFood(foodID: Int)
    {
        database.deleteDatabase("FOODS", statement: "FoodID = \(foodID)")
        

    }
    
   
    // MARK: Create Popup
    
    var blurView : UIView?
    var popUpVC : AddViewControllerBase?
    
    func createBlurView() -> UIView {
        let blurView = UIView(frame: view.bounds)
        blurView.backgroundColor = UIColor.black
        blurView.alpha = 0.5
        
        return blurView
    }
    
    func displayContentController(_ content : AddViewControllerBase) {
        
        popUpVC = content
        
        blurView = createBlurView()
        let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapDismissGesture(_:)))
        blurView?.addGestureRecognizer(dismissTapGesture)
        
        view.addSubview(blurView!)
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        addChildViewController(content)
        content.view.bounds = CGRect(x: 0, y: 0, width: view.bounds.width / 2.5, height: view.bounds.height / 1.2)
        content.view.alpha = 0.5
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: {
            
            content.view.alpha = 1.0
            content.view.center = CGPoint(x: self.view.bounds.width / 2.0, y: self.view.bounds.height / 2.0)
            self.view.addSubview(content.view)
            content.didMove(toParentViewController: self)
            
            }, completion: nil)
        
    }
    
    
    
    func animateDismissAddNewFoodView(_ addNewVC : AddViewControllerBase) {
        let bounds = addNewVC.view.bounds
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions(), animations: {
            
            addNewVC.view.alpha = 0.5
            addNewVC.view.center = CGPoint(x: self.view.bounds.width / 2.0, y: -bounds.height)
            self.blurView?.alpha = 0.0
            
        }){(Bool) in
            addNewVC.view.removeFromSuperview()
            addNewVC.removeFromParentViewController()
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            self.blurView?.removeFromSuperview()
           
            DispatchQueue.main.async
            {
                self.getDataFood("")
            }
        }
        
    }
    
    func tapDismissGesture(_ tapGesture : UITapGestureRecognizer) {
        animateDismissAddNewFoodView(popUpVC!)
    }

}

extension ViewFoodViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "DELETE") { (rowAction, indexPath) in
            print("delete")
            let deleteAlert = UIAlertController(title: "Delete Food", message: "Are You Sure to delete this food ? ", preferredStyle: UIAlertControllerStyle.alert)
            
            deleteAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
                
                print("Confirm")
                self.deleteFood(foodID: self.itemsFood[indexPath.row].foodId)
                do {
                    try FileManager.default.removeItem(at: self.getImageDirectory().appendingPathComponent("\((self.itemsFood[indexPath.row].foodName)!).png"))
                } catch let error as NSError {
                    print(error.debugDescription)
                }
                DispatchQueue.main.async
                    {
                        self.getDataFood("")
                }
                

            }))
            
            deleteAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
                print("Caasdadsd")
                
                
            }))
            
            self.present(deleteAlert, animated: true, completion: nil)
        }
        
        delete.backgroundColor = UIColor(red: 244/255, green: 117/255, blue: 100/255, alpha: 1.0)
        
        let edit = UITableViewRowAction(style: .normal, title: "EDIT") { (rowAction, indexPath) in
            let editAlert = UIAlertController(title: "Edit Food", message: "Are You Sure to edit this food ? ", preferredStyle: UIAlertControllerStyle.alert)
            
            editAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
                
                
                print(self.itemsFood[indexPath.row].foodId)
                
                self.editFood(foodID: self.itemsFood[indexPath.row].foodId, foodName: self.itemsFood[indexPath.row].foodName as String, description: self.itemsFood[indexPath.row].descript as String, price: self.itemsFood[indexPath.row].price, foodStatus: self.itemsFood[indexPath.row].foodStatus, urlImg: self.itemsFood[indexPath.row].urlImg as String, categoryID: self.itemsFood[indexPath.row].categoryId, discountID: self.itemsFood[indexPath.row].discountId)

            }))
            
            editAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
                print("Cancel")
                
                
            }))
            
            self.present(editAlert, animated: true, completion: nil)
            
            
            
            
        }
        edit.backgroundColor = UIColor(red: 244/255, green: 117/255, blue: 100/255, alpha: 1.0)

        return [delete, edit]
        
    }

}

extension ViewFoodViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsFood.count
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.viewFoodTable.dequeueReusableCell(withIdentifier: "Cell") as! OrderTableViewCell

        
        
        let currentItem = itemsFood[(indexPath as NSIndexPath).row]
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let pathImage = paths[0].appendingPathComponent("image/\((currentItem.urlImg)!).png")
        let data = NSData(contentsOf: pathImage)
        cell.img_Food.image = UIImage(data: data! as Data)
        
        
        cell.lbl_FoodName.text = currentItem.foodName as String?
        cell.lbl_Description.text = currentItem.descript as String
        cell.lbl_FoodPrice.text =  "Price: " + String((currentItem.price)!) + "$"
        cell.lbl_DiscountLable.text = "Discount:"

        let status = currentItem.foodStatus
        if (status == true)
        {
            cell.button_Order.setBackgroundImage(UIImage( named: "btnaddtoorder"), for: UIControlState())
        }
        if (status == false)
        {
            cell.button_Order.setBackgroundImage(UIImage( named: "btnaddtoorder_disable"), for: UIControlState())
            cell.button_Order.isUserInteractionEnabled = false
        }
//        
        let image :String = getValueDiscount(discountId: currentItem.discountId)
        cell.img_DiscountImage.image = UIImage.gifWithName("\(image)")

        return cell
    }
}


extension ViewFoodViewController: UITextFieldDelegate
{
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
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
        
            
            return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
}


extension ViewFoodViewController: AddNewFoodDelegate
{
    
    func dismissAddNewFoodtController(addnnewVC: AddViewControllerBase) {
        animateDismissAddNewFoodView(addnnewVC)

    }

}
