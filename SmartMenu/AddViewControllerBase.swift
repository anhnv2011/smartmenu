//
//  AddViewControllerBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/26/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

//@objc protocol  AddNewFoodDelegate {
//    
//  @objc optional func dismissAddNewFoodtController(addnnewVC : AddViewControllerBase)
//    
//}

class AddViewControllerBase: UIViewController {

    @IBOutlet weak var tf_FoodName: UITextField!
    @IBOutlet weak var tv_Description: UITextView!
    @IBOutlet weak var tf_Price: UITextField!
    @IBOutlet weak var switch_Status: UISwitch!
    @IBOutlet weak var button_Category: UIButton!
    @IBOutlet weak var button_Discount: UIButton!
    @IBOutlet weak var image_View: UIImageView!
    @IBOutlet weak var button_Action: UIButton!
  
    var delegate : AddNewFoodDelegate?
 
    
    var categoryListView = ListView()
    var discountListView = ListView()
    
    var itemOfCategoryListView: [Label]!
    var itemOfDiscountListview: [Label]!
    
    
    
    var imagePicker = UIImagePickerController()
    var database = DataBase.sharedInstance

    var titleButton = "Add"
    
    var currentFoodId: Int!
    var currentFoodName = ""
    var currentDescription = ""
    var currentPrice:Float = 0
    var currentStatus:Bool = true
    var currentCategogy: Int = 1
    var currentDiscount: Int = 1
    var currentImage = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tf_FoodName.placeholder = "FoodName"
        tf_FoodName.delegate = self
        tf_FoodName.tag = 100

        tv_Description.delegate = self
        tv_Description.text = "Description"
        tv_Description.textColor = UIColor.lightGray
        
        tf_Price.tag = 101
        tf_Price.delegate = self
        
        button_Action.setTitle(titleButton, for: .normal)
        
        
        addCategoryListView()
        addDiscountListView()
       
        categoryListView.delegateSelected = self
        setupListView()

        discountListView.delegateSelected = self
        setupListView2()
        
        button_Action.isEnabled = false
        
        
        
        setupDataForView()
        
        
        
    }
    
    func setupDataForView()
    {
        tf_FoodName.text = currentFoodName
        
        tv_Description.text = currentDescription
        tv_Description.textColor = UIColor.black
        
        tf_Price.text = String(currentPrice)
    
        
        if currentStatus == true
        {
            switch_Status.isOn = true
        }
        else
        {
            switch_Status.isOn = false
        }
        
        button_Category.setTitle("\(getTitleWithCategoryID(currentCategogy)!)", for: .normal)
        
        button_Discount.setTitle("\(getTitleWithDiscountID(currentDiscount)!)", for: .normal)
        
        print(currentImage)
        if titleButton == "Edit"
        {
//            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//            let pathImage = paths[0].appendingPathComponent("image/\((currentImage)).png")
            
            let pathImage = getDocumentsDirectory().appendingPathComponent("\((currentImage)).png")
            let data = NSData(contentsOf: pathImage)
            image_View.image = UIImage(data: data! as Data)
            button_Action.isEnabled = true
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // checkStatusOfButtonAction()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBAction func button_Action(_ sender: AnyObject) {
        currentFoodName = tf_FoodName.text!
        if let image = image_View.image
        {
            if let data = UIImagePNGRepresentation(image) {
                let filename = getDocumentsDirectory().appendingPathComponent("\(currentFoodName).png")
                //print(filename)
                try? data.write(to: filename)
            }
        }
        
        currentDescription = tv_Description.text
        currentPrice = Float(tf_Price.text!)!
        
        if switch_Status.isOn 
        {
            currentStatus = true
        }
        else
        {
            currentStatus = false
        }
//        print(currentCategogy)
//        print(currentDiscount)
        
        currentImage = currentFoodName
        
        
        if titleButton == "Add"
        {
        addFood(foodName: currentFoodName, description: currentDescription, price: Float(currentPrice), foodStatus: (currentStatus != nil), urlImg: currentImage, categoryID: currentCategogy, discountID: currentDiscount)
        }
        
        else
        {
        editFood(foodID: currentFoodId, foodName: currentFoodName, description: currentDescription, price: currentPrice, foodStatus: currentStatus, urlImg: currentFoodName, categoryID: currentCategogy, discountID: currentDiscount)
            
            if let image = image_View.image
            {
                if let data = UIImagePNGRepresentation(image) {
                    let filename = getDocumentsDirectory().appendingPathComponent("\(currentFoodName).png")
                    //print(filename)
                    try? data.write(to: filename)
                }
            }
            
        }
    }
    
    @IBAction func buttonChooseImage(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
           // print("Button capture")
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
            //button_Action.isEnabled = true
    }
    

}

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0].appendingPathComponent("image")
        return documentsDirectory
    }
  
    
    
    
    
    // MARK: - Add food
    
    func addFood(foodName: String, description: String, price: Float, foodStatus : Bool, urlImg: String, categoryID : Int, discountID: Int )
    {

        database.insertDatabase("FOODS", dict: ["FoodName":"\(foodName)", "Description" :"\(description)", "Price":"\(price)", "FoodStatus":"\(foodStatus)", "UrlImg":"\(urlImg)", "CategoryID":"\(categoryID)", "DiscountID":"\(discountID)"])
    
        
        DispatchQueue.main.async
        {
            self.delegate?.dismissAddNewFoodtController!(addnnewVC: self)
            
        }
    }
    
    // MARK: - Edit Food
    
    func editFood(foodID: Int, foodName: String, description: String, price: Float, foodStatus: Bool, urlImg: String, categoryID: Int, discountID: Int)
        
    {
        database.updateDatabase("FOODS", colums: "FoodName", value: "\(foodName)", statement:"FoodID = \(currentFoodId!)")
        database.updateDatabase("FOODS", colums: "Description", value: "\(description)", statement:"FoodID = \(currentFoodId!)")
        database.updateDatabase("FOODS", colums: "Price", value: "\(price)", statement:"FoodID = \(currentFoodId!)")
        database.updateDatabase("FOODS", colums: "FoodStatus", value: "\(foodStatus)", statement:"FoodID = \(currentFoodId!)")
        database.updateDatabase("FOODS", colums: "UrlImg", value: "\(urlImg)", statement:"FoodID = \(currentFoodId!)")
        database.updateDatabase("FOODS", colums: "CategoryID", value: "\(categoryID)", statement:"FoodID = \(currentFoodId!)")
        database.updateDatabase("FOODS", colums: "DiscountID", value: "\(discountID)", statement:"FoodID = \(currentFoodId!)")
        
        DispatchQueue.main.async
            {
                self.delegate?.dismissAddNewFoodtController!(addnnewVC: self)
                
        }
        
    }
    

    // MARK: - Add ListView to view
    
    
    func addCategoryListView ()
    {
        
        self.view.addSubview(categoryListView)
        categoryListView.isHidden = true
        categoryListView.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: categoryListView, attribute: .centerX, relatedBy: .equal, toItem: button_Category, attribute: .centerX, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: categoryListView, attribute: .top, relatedBy: .equal, toItem: button_Category, attribute: .bottom, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: categoryListView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        let cn4 = NSLayoutConstraint(item: categoryListView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
    }

    
    func addDiscountListView()
    {
        
        self.view.addSubview(discountListView)
        discountListView.isHidden = true
        discountListView.translatesAutoresizingMaskIntoConstraints = false
        
        let cn1 = NSLayoutConstraint(item: discountListView, attribute: .centerX, relatedBy: .equal, toItem: button_Discount, attribute: .centerX, multiplier: 1.0, constant: 0)
        let cn2 = NSLayoutConstraint(item: discountListView, attribute: .top, relatedBy: .equal, toItem: button_Discount, attribute: .bottom, multiplier: 1.0, constant: 0)
        let cn3 = NSLayoutConstraint(item: discountListView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        let cn4 = NSLayoutConstraint(item: discountListView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        
        NSLayoutConstraint.activate([cn1, cn2, cn3, cn4])
        
    }
    
    
    // MARK: - Action with button relate listview
    
    
    @IBAction func button_Category(_ sender: AnyObject) {
        if(categoryListView.isHidden == true)
        {
            categoryListView.isHidden = false
        
        }
        else
        {
            categoryListView.isHidden = true
        }
        
    }


    @IBAction func button_Discount(_ sender: AnyObject) {
        if(discountListView.isHidden == true)
        {
            discountListView.isHidden = false
            
        }
        else
        {
            discountListView.isHidden = true
        }

    }
    
    
    
    // MARK: - LoadData For ListView
    
    func getCategoryData() -> [Label]

    {
        
        itemOfCategoryListView = [Label]()
        let dicts = self.database.viewDatabase("CATEGORIES", columns: ["*"], statement: "")
        for item in dicts
        {
            itemOfCategoryListView.append(Label(displayTableName: item["CategoryName"] as! String , id: item["CategoryID"] as! Int, column: "CategoryID" ))
        }
        return itemOfCategoryListView
    }
    
    func setupListView() {
        itemOfCategoryListView = getCategoryData()
        categoryListView.delegateSelected = self
        categoryListView.items = itemOfCategoryListView
        categoryListView.typeListView = TypeListView.category
    }
    
    func getDiscountData() -> [Label]

    {
        
        itemOfDiscountListview = [Label]()
        let dicts = self.database.viewDatabase("DISCOUNTS", columns: ["*"], statement: "")
        for item in dicts
        {
            itemOfDiscountListview.append(Label(displayTableName: String(describing: item["DiscountValue"]!) , id: item["DiscountID"] as! Int , column: "DiscountID" ))

        }
        return itemOfDiscountListview

    }
    func setupListView2() {
        itemOfDiscountListview = getDiscountData()
        discountListView.delegateSelected = self
        discountListView.items = itemOfDiscountListview
        discountListView.typeListView = TypeListView.discount
    }
    
    
    
    // MARK: - Load title for button
    func getTitleWithCategoryID(_ index: Int) -> String?

    {
        for label in itemOfCategoryListView
        {
            if (label.id == index)
            {
                return label.displayTableName
            }
        }
        return nil
    }

    func getTitleWithDiscountID(_ index: Int) -> String?
        
    {
        for label in itemOfDiscountListview
        {
            if (label.id == index)
            {
                return label.displayTableName
            }
        }
        return nil
    }
    
    
    func loadTitleForCategoryButton(_ index: Int)
    {
        button_Category.setTitle(getTitleWithCategoryID(index), for: UIControlState())
    
    }
    func loadTitleForDiscountButton(_ index: Int)
    {
        button_Discount.setTitle(getTitleWithDiscountID(index), for: UIControlState())
        
    }
    
    
 
}
extension AddViewControllerBase: UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if tv_Description.textColor == UIColor.lightGray {
            tv_Description.text = ""
            tv_Description.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if tv_Description.text == "" {
            
            tv_Description.text = "Description"
            tv_Description.textColor = UIColor.lightGray
        }
        
    }


}

extension AddViewControllerBase: UIImagePickerControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        image_View.contentMode = .scaleAspectFit //3
        image_View.image = chosenImage //4
        dismiss(animated: true, completion: nil) //5
    }

}

extension AddViewControllerBase: UINavigationControllerDelegate
{

}
extension AddViewControllerBase: SelectedItem
{
    func selectedCategory(_ id: Int)
    
    {
        currentCategogy = id
        loadTitleForCategoryButton(currentCategogy)
        categoryListView.isHidden = true
    }
    
    func selectedDiscount(_ id: Int) {
        currentDiscount = id
        loadTitleForDiscountButton(currentDiscount)
        discountListView.isHidden = true
    }

}

extension AddViewControllerBase: UITextFieldDelegate
{
  

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
       
            
//        
        if textField.tag == 101
        {
            let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
            
            var counterdot = 0
        
            let components = string.components(separatedBy: inverseSet)

            if ((string == ".") && counterdot == 0)
            {
            let filtered = components.joined(separator: ".")
            print(filtered)
            counterdot = 1
                
            return string == filtered
            }
            else
            {
                let filtered = components.joined(separator: "")
                print(filtered)
                
                return string == filtered

            }
        }
        
        

        return true

    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 100
        {
            if textField.hasText
            {
                button_Action.isEnabled = true
            }
            else
            {
                button_Action.isEnabled = false
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
