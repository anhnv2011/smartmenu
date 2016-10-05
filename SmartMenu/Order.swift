//
//  Order.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/29/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
class Order: NSObject
{
    var orderId:Int!
    var tableId:Int!
    var orderDate:NSString!
    var orderStartTime:NSString!
    var paid:Bool!
    init(orderId: Int, tableId: Int, orderDate: NSString, orderStartTime: NSString, paid: Bool)
    {
        self.orderId = orderId
        self.tableId = tableId
        self.orderDate = orderDate
        self.orderStartTime = orderStartTime
        self.paid = paid
    }
}