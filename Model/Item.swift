//
//  Item.swift
//  Brownie
//
//  Created by Victor on 21/09/21.
//

import UIKit

class Item: NSObject {
    var name: String
    var calories: Double
    
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
}
