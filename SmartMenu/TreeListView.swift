//
//  TreeListView.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/23/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
import UIKit
import RATreeView

class TreeListView: UIViewController //, RATreeViewDelegate, RATreeViewDataSource

{

    var treeView: RATreeView!
    var items = [NSDictionary]()
    var itemsOfListView:[Label]!
    var data : [DataObject]!

    var database = DataBase.sharedInstance

//    convenience init() {
//        self.init(nibName : nil, bundle: nil)
//    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        self.data = getData()
//            //TreeListView.commonInit()
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        data = self.getData()
//            //TreeListView.commonInit()
//        super.init(coder: aDecoder)
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        treeView = RATreeView(frame: view.bounds)
        //treeView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        treeView.register(UINib.init(nibName: "TreeTableViewCell", bundle: nil), forCellReuseIdentifier: "TreeTableViewCell")
        treeView.autoresizingMask = UIViewAutoresizing(rawValue:UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        //treeView.delegate = self
        treeView.dataSource = self
        treeView.treeFooterView = UIView()
        treeView.backgroundColor = UIColor.clear
        view.addSubview(treeView)
        getData()
        print(data[0].displayTableName)
//        getDataTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()

    }
//    func getDataTable() -> [Label]
//    {
//        itemsOfListView = [Label]()
//        
//        let dicts = self.database.viewDatabase("TABLES", columns: ["*"], statement: "")
//        for item in dicts
//        {
//            itemsOfListView.append(Label(displayTableName: item["TableName"] as! String, id:item["TableID"]as! Int, column: "TableID"))
//        }
//        return itemsOfListView
//        
//    }
    
    func getData()
    {
        data = [DataObject]()
        let dicts = self.database.viewDatabase("TABLES", columns: ["*"], statement: "")
        for item in dicts
        {
            data.append(DataObject(displayTableName: item["TableName"] as! String, id:item["TableID"]as! Int, column: "TableID"))
        }
        self.treeView.reloadData()
    }
    
    
//    func getTitleWithID(_ index: Int) -> String?
//    {
//        for label in itemsOfListView
//        {
//            if (label.id == index)
//            {
//                return label.displayTableName
//            }
//        }
//        return nil
//    }
}

//extension TreeListView {
//    
//    static func commonInit() -> [DataObject] {
//        let ban5 = DataObject(displayTableName: <#T##String#>, id: <#T##Int#>, column: <#T##String#>)
//        let ban1 = DataObject(name: "Ban 1")
//        let ban2 = DataObject(name: "Ban 2")
//        let ban3 = DataObject(name: "Ban 3")
//        let ban4 = DataObject(name: "Ban 4")
//
//        let ban = DataObject(name: "Ban", children: [ban1, ban2, ban3, ban4])
//        //for label in itemsOfListView
//        return [ban]
//    }
//    
//}

extension TreeListView: RATreeViewDataSource
{
    func treeView(_ treeView: RATreeView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item = item as? DataObject {
            return item.children.count
        } else {
            if let data = self.data
            {
                return data.count
            }
            return 0
        }
    }
    func treeView(_ treeView: RATreeView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? DataObject {
            return item.children[index]
        } else {
            return data[index] as AnyObject
        }
    }
    func treeView(_ treeView: RATreeView, cellForItem item: Any?) -> UITableViewCell {
        let cell = treeView.dequeueReusableCell(withIdentifier: "TreeTableViewCell") as! TreeTableViewCell
        let item = item as! DataObject
        
        let level = treeView.levelForCell(forItem: item)
        let detailsText = "Number of children \(item.children.count)"
        cell.selectionStyle = .none
        cell.setup(withTitle: "0", detailsText: detailsText, level: 1, additionalButtonHidden: false)
        cell.setup(withTitle: item.displayTableName, detailsText: detailsText, level: level + 3 , additionalButtonHidden: false)
        return cell
    }
    
    
    
}


extension TreeListView : RATreeViewDelegate
{
    func treeView(_ treeView: RATreeView, didSelectRowForItem item: Any) {
        
    }
}


