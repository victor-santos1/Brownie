//
//  ItemDataAccess.swift
//  Brownie
//
//  Created by Victor on 24/09/21.
//

import Foundation

class ItemDataAccess {
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("items")
    
    func save(_ items: [Item]) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: Self.archiveURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func read() -> [Item] {
        do {
            let data = try Data(contentsOf: Self.archiveURL)
            guard let savedItems = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Item] else { return [] }
            return savedItems
        } catch  {
            print(error.localizedDescription)
            return []
        }
    }
}
