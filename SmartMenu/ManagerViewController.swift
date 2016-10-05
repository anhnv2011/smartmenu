//
//  Manager.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/16/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ManagerViewController: ManagerViewControllerBase {

    @IBOutlet weak var tableCollection: UICollectionView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var database = DataBase.sharedInstance
    var listTable = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 200
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))

            tableCollection.register(UINib(nibName: "TableCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellCollection")
            tableCollection.delegate = self
            tableCollection.dataSource = self
            getListTable()
           // print(listTable)
        }
    }
    
    
    func getListTable()
    {
        listTable = [String]()
        
        let dicts = self.database.viewDatabase("TABLES", columns: ["*"], statement: "")
        for item in dicts
        {
            //print(item["TableName"] as! String)
            listTable.append(item["TableName"] as! String)
        }
        
    }

   
}
extension ManagerViewController: UICollectionViewDelegate
{

}
extension ManagerViewController: UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTable.count
    
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCollection", for: indexPath) as! TableCollectionViewCell
        
        var nameLabel : String!
        nameLabel = listTable[(indexPath as NSIndexPath).item]
        cell.nameLabel.text = nameLabel
        cell.getOrderDetailData("Where OrderID = '\(cell.getOrderIdWithTableName(tableName: nameLabel))'")
//        cell.getListTable(nameLabel)
        var a = cell.numberFoodActive
        print(a)
        return cell
    }
}

extension ManagerViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 70, height: self.view.frame.height/2 - 70)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat (10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets (top: 0, left: 30, bottom: 0, right: 30)
    }
}
