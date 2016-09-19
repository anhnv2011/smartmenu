//
//  AllPriceController.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/26/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class AllPriceController: AllPriceControllerTableBase, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailOrderTable.delegate = self
        self.detailOrderTable.dataSource = self
        
        detailOrderTable.registerClass(OrderTableViewCell.self, forCellReuseIdentifier: "Cell")

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.detailOrderTable.dequeueReusableCellWithIdentifier("Cell") as! OrderTableViewCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 210
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
