//
//  Food.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/29/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
struct Food
{
    var foodId:Int!
    var foodName:NSString!
    var descript:NSString!
    var price:Float!
    var foodStatus:Bool!
    var urlImg:NSString!
    var categoryId:Int!
    var discountId:Int!
    init(foodId: Int, foodName: NSString, descript: NSString, price: Float, foodStatus: Bool, urlImg: NSString, categoryId: Int, discountId: Int)
        {
            self.foodId = foodId
            self.foodName = foodName
            self.descript = descript
            self.price = price
            self.foodStatus = foodStatus
            self.urlImg = urlImg
            self.categoryId = categoryId
            self.discountId = discountId
    
    
        }
}
