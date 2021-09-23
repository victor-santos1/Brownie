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
    
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    let archiveURL = documentsDirectory.appendingPathExtension("meals")
    
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
    
    func totalCalories() -> Double {
        var total = 0.0
    
        for item in items {
            total += item.calories
        }
        
        return total
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(happiness, forKey: PropertyKey.happiness)
        coder.encode(items, forKey: PropertyKey.items)
    }
    
//    required convenience init?(coder: NSCoder) {
//        guard let titile = coder.decodeObject(forKey: PropertyKey.name) as? String else {
//            print("Unable to decode title.")
//            return nil
//        }
//
//        guard let happiness = coder.decodeObject(forKey: PropertyKey.happiness) as? Int else {
//            print("Unable to decode title.")
//            return nil
//        }
//
//        guard items = coder.decodeObject(forKey: PropertyKey.items) as? [Item] else {
//            print("Unable to decode title.")
//            return nil
//        }
//        self.init(titile: titile, happiness: happiness, items: items)
//    }
}
