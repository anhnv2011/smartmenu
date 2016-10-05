//
//  ListView.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/27/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ListView: UITableView {
    
    var delegateSelected : SelectedItem!
    var items = [Label]()
    var typeListView = TypeListView.none
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect, style: UITableViewStyle)
    {
        super.init(frame: frame, style: style)
        self.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.delegate = self
        self.dataSource = self
    }
   
    func selectOption(_ index: Int)
    {
        switch typeListView {
        case .tables:
            self.delegateSelected.selectedTable!(items[index].id)
            break
        case .category:
            self.delegateSelected.selectedCategory!(items[index].id)
            break
        case .discount:
            self.delegateSelected.selectedDiscount!(items[index].id)
            break
        
        default:
            self.deselectRow(at: self.indexPathForSelectedRow!, animated: false)
            break
        }
    }
    
}


extension ListView : UITableViewDelegate
{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //self.delegateSelected.selectedTable!(items[(indexPath as NSIndexPath).row].id)
        selectOption((indexPath as NSIndexPath).row)
        

    }

}

extension ListView : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "Cell")
        let currentItem = items[(indexPath as NSIndexPath).row]
        cell?.textLabel?.text = currentItem.displayTableName
        cell?.textLabel?.textAlignment = .center
        return cell!
    }
}
