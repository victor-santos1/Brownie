//
//  Item.swift
//  Brownie
//
//  Created by Victor on 21/09/21.
//

import UIKit

class Item: NSObject, NSCoding {
    var name: String
    var calories: Double

    init?(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
    
    struct PropertyKey {
        static let name = "title"
        static let calories = "dueDate"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(calories, forKey: PropertyKey.calories)
    }
    
    required convenience init?(coder: NSCoder) {
        guard let name = coder.decodeObject(forKey: PropertyKey.name) as? String else {
            print("Unable to decode name.")
            return nil
        }
        let calories = coder.decodeDouble(forKey: PropertyKey.calories)
        self.init(name: name, calories: calories)
    }
}
