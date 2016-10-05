//
//  OrderDetail.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/29/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
struct OrderDetail
{
    var orderId: Int!
    var foodId: Int!
    var quantity: Int!
    var unitPrice: Float!
    var isNew: Bool!
    init (orderId: Int, foodId :Int, quantity: Int, unitPrice: Float, isNew: Bool)
    {
        self.orderId = orderId
        self.foodId = foodId
        self.quantity = quantity
        self.unitPrice = unitPrice
        self.isNew = isNew
    }
}
