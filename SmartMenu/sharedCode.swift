//
//  sharedCode.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/5/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

//import Foundation


extension Date
{
    func hour() -> Int
    {
        //Get Hour
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.hour, from: self)
        let hour = components.hour
        
        //Return Hour
        return hour!
    }
    
    
    func minute() -> Int
    {
        //Get Minute
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.minute, from: self)
        let minute = components.minute
        
        //Return Minute
        return minute!
    }
    
    func toShortTimeString() -> String
    {
        //Get Short Time String
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let timeString = formatter.string(from: self)
        
        //Return Short Time String
        return timeString
    }
    
    func date() -> String

    {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let day = components.day
        let month = components.month
        let year = components.year
        
        let date = String(describing: day) + String(describing: month) + String(describing: year)
        return date
    }
}
