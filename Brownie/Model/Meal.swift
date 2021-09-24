//
//  Meal.swift
//  Brownie
//
//  Created by Victor on 21/09/21.
//

import UIKit

class Meal: NSObject, NSCoding {    
    
    var name: String
    var happiness: Int
    var items: [Item]
    
    struct PropertyKey {
        static let name = "name"
        static let happiness = "happiness"
        static let items = "items"
    }
    
    init?(name: String, happiness: Int, items: [Item] = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func totalItems() -> String {
        var itemsTotal = ""
        
        switch items.count {
        case 0:
            itemsTotal = "Não tem items adicionados"
        case 1:
            itemsTotal = "Item:"
        default:
            itemsTotal = "Items:"
        }
       
        for item in items {
            itemsTotal += (" \(item.name)")
        }
        return itemsTotal
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(happiness, forKey: PropertyKey.happiness)
        coder.encode(items, forKey: PropertyKey.items)
    }
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else {
            print("Unable to decode name.")
            return nil
        }
        let happiness = coder.decodeInteger(forKey: PropertyKey.happiness)
        let items = coder.decodeObject(forKey: PropertyKey.items) as! [Item]
        self.init(name: name, happiness: happiness, items: items)
    }
}
