//
//  Protocol.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/27/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
import CoreGraphics

enum TypeListView
{
    case tables
    case category
    case discount
    case none

}

@objc protocol SelectedItem
{
    @objc optional func selectedTable(_ id: Int)
    @objc optional func selectedCategory(_ id: Int)
    @objc optional func selectedDiscount(_ id: Int)

    
}
@objc protocol  AddNewFoodDelegate {
    
    @objc optional func dismissAddNewFoodtController(addnnewVC : AddViewControllerBase)
    
}
