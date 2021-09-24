//
//  Meal.swift
//  Brownie
//
//  Created by Victor on 21/09/21.
//

import UIKit

class Meal: NSObject {
    var name: String
    var happiness: Int
    var items: [Item]
    
    init(name: String, happiness: Int, items: [Item] = []) {
        self.name = name
        self.happiness = happiness
        self.items = items

    }
    
    func totalCalories() -> Double {
        var total = 0.0
    
        for item in items {
            total += item.calories
        }
        
        return total
    }
}