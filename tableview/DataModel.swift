//
//  DataModel.swift
//  tableview
//
//  Created by Adnan Kidwai on 4/30/21.
//

import Foundation

struct DataModel {
    let name: String
    let details: String?
    
}

var names = [
    DataModel(name: "twitter", details: nil),
    DataModel(name: "instagram", details: nil),
    DataModel(name: "facebook", details: nil),
    DataModel(name: "reddit", details: nil),
    DataModel(name: "bumble", details: "trying to find gril"),
    DataModel(name: "tinder", details: "trying to find more grils")
]
