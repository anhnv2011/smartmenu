//
//  AllPriceController.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/26/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class AllOrderController: AllOrderControllerTableBase {

    var listView = ListView()
    var currentTable = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailOrderTable.delegate = self
        self.detailOrderTable.dataSource = self
        listView.delegateSelected = self
        detailOrderTable.register(AllOrderTableViewCell.self, forCellReuseIdentifier: "Cell")
        loadTableId(currentTable)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadTableId(currentTable)
    }
 
    func loadTableId(_ index: Int)
    {
        
        print("ban o your order: \(index)")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    func getDataAllOrder(_ statement: String)
    {
        
        items = self.database.viewDatabase("ORDERDETAIL", columns: ["*"], statement: statement)
        super.detailOrderTable.reloadData()
        
        
    }

    
}


extension AllOrderController: UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

extension AllOrderController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.detailOrderTable.dequeueReusableCell(withIdentifier: "Cell") as! AllOrderTableViewCell
        
        return cell
    }

}

extension AllOrderController: SelectedItem
{
    func selectedTable(_ id: Int) {
        print("ALl order: \(id)")
        currentTable = id
        loadTableId(currentTable)
    }
}
