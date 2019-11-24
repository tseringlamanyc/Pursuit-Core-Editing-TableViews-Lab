//
//  GroceryList.swift
//  EditingTableViewLab
//
//  Created by Tsering Lama on 11/21/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation



struct Grocery {
    
    enum State: CaseIterable {
        case purchased
        case notpurchased
    }
    
    var name: String
    var price: String
//    var state: State
    
    static func createList() -> [Grocery] {
        return [
            Grocery(name: "iPhone", price: "320.0"),
            Grocery(name: "Potato", price: "10.0")
        ]
        
    }
    
}
