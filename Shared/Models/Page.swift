//
//  Page.swift
//  Cubby
//
//  Created by Sabrina Jain on 6/25/20.
//  Generic for types of pages
//

import Foundation

class PageType {
    
    //Variables
    var typeName : String //type of page collection
    var displayName : String //name of page collection
    //TO-DO : Create list of strict names so that types can be identified
    
    //Constructor (if user wants to customize name)
    init(_ typeName: String, _ displayName : String) {
        self.typeName = typeName
        self.displayName = displayName
    }
    //Constructor (if user doesn't want to customize name)
    init (_ typeName: String) {
        self.typeName = typeName
        self.displayName = typeName
    }
    
}
