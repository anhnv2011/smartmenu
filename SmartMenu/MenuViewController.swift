//
//  MenuViewController.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/7/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class MenuViewController: MenuControllerTableBase{

    
    var items = [NSDictionary]()
    var database = DataBase.sharedInstance
    var arrayCell = [String]()
    var currentIndexpath = 0
    var currerntTable = 0
    var currentStatement = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoryTable.delegate = self
        self.categoryTable.dataSource = self
        self.otherTable.delegate = self
        self.otherTable.dataSource = self
        
        //categoryTable.registerClass(self, forCellReuseIdentifier: "Cell")
        categoryTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        otherTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell2")
        getCategoriesData("")
        
        insertToArrayCell()
    }

    func insertToArrayCell()
    {
        arrayCell.append("Price <= 100")
        arrayCell.append("100 < Price <= 200")
        arrayCell.append("Price > 200")
    }
    
    // MARK: - LoadData
    
    func getCategoriesData(_ statement: String)
    {
        items = self.database.viewDatabase("CATEGORIES", columns: ["*"], statement: statement)
    }
    
    
    
    
    // MARK: Push Data

    override func clickMenu() {
        performSegue(withIdentifier: "StatementFilter", sender: nil)
        currerntTable = 3
        
    }
    
    
    override func showMore() {
        performSegue(withIdentifier: "showMore", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "StatementFilter")
        {
            
            
            // khởi tạo VC mà segue sẽ truyền đến
            let nav = segue.destination as! UINavigationController
            let orderVC = nav.topViewController as! OrderViewController
            
            if currerntTable == 1
            {
                let selectedRowIndex: Int = (self.categoryTable.indexPathForSelectedRow! as NSIndexPath).row
                orderVC.statementFilter = "Where CategoryID = \(selectedRowIndex + 1)"
            }
            if currerntTable == 2
            {
                var statement = ""
                let selectedRowIndex2: Int = (self.otherTable.indexPathForSelectedRow! as NSIndexPath).row
                switch selectedRowIndex2 {
                case 0:
                    statement = "Where Price <= 100"
                case 1:
                    statement = "Where Price > 100 And Price <= 200"
                case 2:
                    statement = "Where Price > 200"
                    
                default:
                    break
                }
                
                orderVC.statementFilter = statement
            }
            
            if currerntTable == 3
            {
                orderVC.statementFilter = ""
                
            }
        }
        
        
        
        
        if (segue.identifier == "showMore")
        {
//            let nav = segue.destinationViewController as! UINavigationController
//            let showMoreVC = nav.topViewController as! ShowMoreViewController
            
        }
    }
    
}

extension MenuViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return items.count
        return (tableView == self.categoryTable) ? items.count:arrayCell.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == categoryTable)
        {
            let cell = self.categoryTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let currentItem = items[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = (currentItem.object(forKey: "CategoryName") as! String)
            return cell
            cell.textLabel?.textAlignment = .right
        }
            
        else
        {
            let cell2 = self.otherTable.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
            cell2.textLabel?.text = arrayCell[(indexPath as NSIndexPath).row]
            
            return cell2
        }
    }

}

extension MenuViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        print("index path la: \((indexPath as NSIndexPath).row)")
        currentIndexpath = Int((indexPath as NSIndexPath).row)
        if (tableView == categoryTable)
        {
            currerntTable = 1
        }
        if (tableView == otherTable) {
            currerntTable = 2
        }
        performSegue(withIdentifier: "StatementFilter", sender: nil)
    }
    
}
