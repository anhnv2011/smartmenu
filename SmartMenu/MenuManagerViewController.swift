//
//  MenuManagerTableViewController.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/16/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class MenuManagerViewController: MenuManagerBase {


    let section = ["FOOD", "Report", "Orther"]
    
    let items = [["View Table", "View Food", "View Category"], ["Order", "Chart", "Growth"], ["Device", "Account"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.delegate = self
        menuTable.dataSource = self
        menuTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    
    }

}
extension MenuManagerViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.section
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.section.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items[section].count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        
        
        return cell
    }
    
    
   
}

extension MenuManagerViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        
        let cell = items[indexPath.section][indexPath.row]
       
        
        print(cell)
        
        if (cell == "View Food")
        {
            performSegue(withIdentifier: "showViewFood", sender: nil)
        }
        if (cell == "View Table")
        {
//            let subview = AddViewControllerBase(nibName: "AddViewControllerBase", bundle: nil)
//            self.navigationController?.pushViewController(subview, animated: true)

            performSegue(withIdentifier: "showViewTable", sender: nil)
        }
        
}
    

}
