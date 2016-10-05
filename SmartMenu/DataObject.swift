//
//  DataObject.swift
//  RATreeViewExamples
//
//  Created by Rafal Augustyniak on 22/11/15.
//  Copyright © 2015 com.Augustyniak. All rights reserved.
//

import Foundation


class DataObject
{
    //let name : String
    var displayTableName: String!
    var id: Int!
    var column: String!

    fileprivate(set) var children : [DataObject]

   // init(name : String, children: [DataObject]) {
    init(displayTableName : String, id: Int, column: String, children: [DataObject]) {

        //self.name = name
        self.displayTableName = displayTableName
        self.id = id
        self.column = column
        self.children = children
    }

    //convenience init(name : String) {
    
    convenience init(displayTableName : String, id: Int, column: String) {

        //self.init(name: name, children: [DataObject]())
        self.init(displayTableName : displayTableName, id: id, column: column, children: [DataObject]())
    }

    func addChild(_ child : DataObject) {
        self.children.append(child)
    }

    func removeChild(_ child : DataObject) {
        self.children = self.children.filter( {$0 !== child})
    }
}


//extension DataObject {
//
//    static func defaultTreeRootChildren() -> [DataObject] {
//        let ban1 = DataObject(name: "Ban 1")
//        let ban2 = DataObject(name: "Ban 2")
//        let ban3 = DataObject(name: "Ban 3")
//        let ban4 = DataObject(name: "Ban 4")
//        
//        let ban = DataObject(name: "Ban", children: [ban1, ban2, ban3, ban4])
//        return [ban]
//    }
//    
//}
