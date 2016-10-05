//
//  Categories.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/29/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
class Categories: NSObject
{
    var categoryId: Int!
    var categoryName: NSString!
    
    init(categoryId: Int, categoryName: NSString)
    {
        self.categoryId = categoryId
        self.categoryName = categoryName
    }
}