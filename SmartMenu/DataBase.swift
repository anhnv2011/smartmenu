//
//  DataBase.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 8/22/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
import UIKit

class DataBase{

    
    static let sharedInstance = DataBase()
    
    

    var databasePath = NSString()
    private init()
    {
        getPath()
        
//        if(createDatabase() == true)
//        {
//            insertNewValuesToTable()
//        }
        
    }
    
    func insertNewValuesToTable()
    {
        insertDatabase("TABLES", dict: ["TableID":"1", "TableName":"Ban 1"])
    }
    
    
    func getPath()
    {
        let dirPaths =
            NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                .userDomainMask, true)
        
        let docsDir = NSString(string: dirPaths[0])
        print(docsDir)
        
        databasePath = docsDir.appendingPathComponent(
            "smartmenu.db") as NSString
    }
    
    
    func createDatabase() -> Bool
    {
        let filemgr = FileManager.default
        
        if !filemgr.fileExists(atPath: databasePath as String) {
        
            let smartmenuDB = FMDatabase(path: databasePath as String)
            
            if smartmenuDB == nil {
                print("Error: \(smartmenuDB?.lastErrorMessage())")
            }
            
            if (smartmenuDB?.open())! {
//
                
                let sql_Create_FOODS = "create table if not exists FOODS (FoodID integer primary key, FoodName text, Description text, Price float, FoodStatus  boolean, UrlImg text, CategoryID integer, DiscountID integer,  foreign key (CategoryID) references CATEGORIES(CategoryID), foreign key (DiscountID) references DISCOUNTS(DiscountID))"
                let sql_Create_ORDERS = "create table if not exists ORDERS (OrderID integer primary key, TableID integer, OrderDate text, OrderStartTime text, Paid boolean, foreign key (TableID) references TABLES(TableID))"
                let sql_Create_ORDERDETAIL = "create table if not exists ORDERDETAIL (OrderID integer, FoodID integer, Quantity integer, UnitPrice float, isNew boolean, foreign key (OrderID) references ORDERS(OrderID), foreign key (FoodID) references FOODS(FoodID), primary key (OrderID, FoodID))"
                let sql_Create_TABLES = "create table if not exists TABLES (TableID integer primary key, TableName text)"
                let sql_Create_CATEGORIES = "create table if not exists CATEGORIES (CategoryID integer primary key, CategoryName text)"
                let sql_Create_DISCOUNTS = "create table if not exists DISCOUNTS (DiscountID integer primary key, DiscountValue float, StartDate text, EndDate text)"
                //let sql_Create_ACCOUNTS = "create table if not exists ACCOUNTS "
                
                if !(smartmenuDB?.executeStatements(sql_Create_FOODS))! {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
        
                if !(smartmenuDB?.executeStatements(sql_Create_ORDERS))! {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
                if !(smartmenuDB?.executeStatements(sql_Create_ORDERDETAIL))! {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
                if !(smartmenuDB?.executeStatements(sql_Create_TABLES))! {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
                if !(smartmenuDB?.executeStatements(sql_Create_CATEGORIES))! {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
                if !(smartmenuDB?.executeStatements(sql_Create_DISCOUNTS))! {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
                
                
                
                if !(smartmenuDB?.executeStatements("PRAGMA foreign_keys = ON"))!
                {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
            } else {
                print("Error: \(smartmenuDB?.lastErrorMessage())")
            }
            smartmenuDB?.close()
            return true
        }
        return false
    }
    func insertDatabase(_ nameTable: String, dict: NSDictionary)
    {
        //Insert
        var keys = String();
        var values = String();
        var first = true
        for key in dict.allKeys
        {
            if (first == true)
            {
                keys = "'" + (key as! String) + "'"
                values = "'" + (dict.object(forKey: key) as! String) + "'"
                first = false
                continue
            }
            keys = keys + "," + "'" + (key as! String) + "'"
            values = values + "," + "'" + (dict.object(forKey: key) as! String) + "'"
            
            //print(key)
            //print(values)
        }
        let smartmenuDB = FMDatabase(path: databasePath as String)
        if (smartmenuDB?.open())! {
            if !(smartmenuDB?.executeStatements("PRAGMA foreign_keys = ON"))!
            {
                print("Error: \(smartmenuDB?.lastErrorMessage())")
            }
            let insertSQL = "INSERT INTO \(nameTable) (\(keys)) VALUES (\(values))"
            
            // kiểm tra xem dữ liệu truyền vào có lỗi hay kko
            let result = smartmenuDB?.executeUpdate(insertSQL,
                                               withArgumentsIn: nil)
            if !result! {
                print("Error: \(smartmenuDB?.lastErrorMessage())")
            }
        }
        smartmenuDB?.close()
    }
    func viewDatabase(_ table: String, columns: [String], statement: String) -> [NSDictionary]
    {
        
        var allColumns = ""
        var items = [NSDictionary]()
        for column in columns
        {
            if (allColumns == "")
            {
                allColumns = column
            }
            else
            {
                allColumns = allColumns + "," + column
            }
        }
        let querySQL = "Select DISTINCT \(allColumns) From \(table) \(statement)"
        let smartmenuDB = FMDatabase(path: databasePath as String)
        if (smartmenuDB?.open())! {
            let results:FMResultSet? = smartmenuDB?.executeQuery(querySQL,
                                                            withArgumentsIn: nil)
            while ((results?.next()) == true)
            {
                items.append(results!.resultDictionary() as NSDictionary)
            }
        }
        smartmenuDB?.close()
        return items
    }
    func viewDatabaseWithoutDistinct(_ table: String, columns: [String], statement: String) -> [NSDictionary]
    {
        
        var allColumns = ""
        var items = [NSDictionary]()
        for column in columns
        {
            if (allColumns == "")
            {
                allColumns = column
            }
            else
            {
                allColumns = allColumns + "," + column
            }
        }
        let querySQL = "Select \(allColumns) From \(table) \(statement)"
        let smartmenuDB = FMDatabase(path: databasePath as String)
        if (smartmenuDB?.open())! {
            let results:FMResultSet? = smartmenuDB?.executeQuery(querySQL,
                                                                 withArgumentsIn: nil)
            while ((results?.next()) == true)
            {
                items.append(results!.resultDictionary() as NSDictionary)
            }
        }
        smartmenuDB?.close()
        return items
    }

    func updateDatabase(_ table: String, colums: String, value: String, statement: String)
    {
     
        let smartmenuDB = FMDatabase(path: databasePath as String)
        if (smartmenuDB?.open())! {
            if !(smartmenuDB?.executeStatements("PRAGMA foreign_keys = ON"))!
            {
                print("Error: \(smartmenuDB?.lastErrorMessage())")
            }
            let updateSQL = "UPDATE \(table) SET \(colums) = '\(value)' Where \(statement)"
            
            let result = smartmenuDB?.executeUpdate(updateSQL,
                                                   withArgumentsIn: nil)
            if !result! {
                print("Error: \(smartmenuDB?.lastErrorMessage())")
            }
        }
        smartmenuDB?.close()

    }
    
    
    func deleteDatabase(_ table: String, statement: String)
    {
    

            let smartmenuDB = FMDatabase(path: databasePath as String)
            if (smartmenuDB?.open())! {
                if !(smartmenuDB?.executeStatements("PRAGMA foreign_keys = ON"))!
                {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
                let deleteSQL = "DELETE SET NULL FROM \(table) Where \(statement)"
                
                let result = smartmenuDB?.executeUpdate(deleteSQL,
                                                        withArgumentsIn: nil)
                if !result! {
                    print("Error: \(smartmenuDB?.lastErrorMessage())")
                }
            }
            smartmenuDB?.close()

    
    }
    
//    func selectValueDatabase(colums: String, table: String, statement: String) -> String
//    {
//        var value = ""
//        let smartmenuDB = FMDatabase(path: databasePath as String)
//        if smartmenuDB.open() {
//            if !smartmenuDB.executeStatements("PRAGMA foreign_keys = ON")
//            {
//                print("Error: \(smartmenuDB.lastErrorMessage())")
//            }
//            let selectSQL = "SELECT \(colums) From \(table) Where \(statement)"
//            //let ssss = select Paid from Orders where TableID = 1
//            let result = smartmenuDB.executeUpdate(selectSQL,
//                                                   withArgumentsInArray: nil)
//            
//            
//            if !result {
//                print("Error: \(smartmenuDB.lastErrorMessage())")
//            }
//            
//        }
//        smartmenuDB.close()
//        return result
//    }
}
